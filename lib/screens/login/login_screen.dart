import 'package:expenses/env.dart';
import 'package:expenses/models/login/login__reg_status.dart';
import 'package:expenses/models/login/login_reg_state.dart';
import 'package:expenses/screens/login/login_form.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ConnectState<LoginRegState>(
      where: notIdentical,
      map: (state) => state.loginRegState,
      builder: (state) {
        if (state.loginStatus == LoginStatus.success) {
          Env.userFetcher.startApp();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: LoginForm(),
          );
        }

        return Container();
      },
    );
  }
}
