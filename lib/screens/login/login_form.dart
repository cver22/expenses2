/*import 'package:expenses/env.dart';
import 'package:expenses/models/login/login_status.dart';
import 'package:expenses/screens/login/google_login_button.dart';
import 'package:expenses/screens/login/login_button.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/login/login_state.dart';
import 'package:expenses/screens/login/create_account_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {


  @override
  Widget build(BuildContext context) {
    return ConnectState<LoginState>(
        map: (state) => state.loginState,
        where: notIdentical,
        builder: (loginState) {
          if (loginState.loginStatus == LoginStatus.failure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Login Failure'),
                      Icon(Icons.error)
                    ],
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
          }

          return
        });
  }


}*/
