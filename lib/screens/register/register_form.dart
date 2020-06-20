/*import 'package:expenses/env.dart';
import 'package:expenses/models/register/register_state.dart';
import 'package:expenses/models/register/register_status.dart';
import 'package:expenses/screens/register/register_button.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && state.registerStatus != RegisterStatus.submitting;
  }

  @override
  void initState() {
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectState<RegisterState>(
        map: (state) => state.registerState,
        where: notIdentical,
        builder: (registerState) {
          *//*if (registerState.registerStatus == RegisterStatus.submitting) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Registering...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          }

          if (registerState.registerStatus == RegisterStatus.failure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Row(
                  children: <Widget>[
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ));
          }*//*
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autovalidate: true,
                    validator: (_) {
                      return !registerState.isEmailValid
                          ? 'Invalid Email'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock), labelText: 'Password'),
                    obscureText: true,
                    autocorrect: false,
                    autovalidate: true,
                    validator: (_) {
                      return !registerState.isPasswordValid
                          ? 'Invalid Password'
                          : null;
                    },
                  ),
                  RegisterButton(
                    onPressed: isRegisterButtonEnabled(registerState)
                        ? _onFormSubmitted
                        : null,
                  ),
                ],
              ),
            ),
          );
          ;
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    Env.store.dispatch(RegisterEmailValidation(_emailController.text));
  }

  void _onPasswordChanged() {
    Env.store.dispatch(RegisterPasswordValidation(_passwordController.text));
  }

  void _onFormSubmitted() {
    Env.userFetcher.registerWithCredentials(
      email: _emailController.text.toString().trim(),
      password: _passwordController.text.toString(),
    );
  }
}*/
