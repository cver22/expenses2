import 'package:expenses/env.dart';
import 'package:expenses/models/login/login_state.dart';
import 'package:expenses/models/login/login_status.dart';
import 'package:expenses/screens/login/create_account_button.dart';
import 'package:expenses/screens/login/google_login_button.dart';
import 'package:expenses/screens/login/login_button.dart';

import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:flutter/material.dart';
import 'package:expenses/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid &&
        isPopulated &&
        state.loginStatus != LoginStatus.submitting;
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ConnectState<LoginState>(
          where: notIdentical,
          map: (state) => state.loginState,
          builder: (loginState) {
            print('Login status: ${loginState.loginStatus}');
            if (loginState.loginStatus == LoginStatus.success) {
              Env.userFetcher.startApp();
            }

            return Builder(builder: (BuildContext context) {

              //TODO how to show a snackbar
              /*if (loginState.loginStatus == LoginStatus.failure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Login Failure'), Icon(Icons.error)],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              } else if (loginState.loginStatus == LoginStatus.submitting) {

                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Logging in...'),
                          CircularProgressIndicator(),
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }*/


              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child:
                            Image.asset('assets/flutter_logo.png', height: 200),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !loginState.isEmailValid
                              ? 'Invalid Email'
                              : null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !loginState.isPasswordValid
                              ? 'Invalid Password'
                              : null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: <Widget>[
                            LoginButton(
                              onPressed: isLoginButtonEnabled(loginState)
                                  ? () => _onFormSubmitted(loginState)
                                  : null,
                            ),
                            GoogleLoginButton(),
                            CreateAccountButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
    );
  }

  void _onEmailChanged() {
    Env.store.dispatch(EmailValidation(_emailController.text));
  }

  void _onPasswordChanged() {
    Env.store.dispatch(PasswordValidation(_passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onFormSubmitted(LoginState loginState) {
    Env.userFetcher.signInWithCredentials(
      email: _emailController.text.toString().trim(),
      password: _passwordController.text.toString(),
    );
  }
}
