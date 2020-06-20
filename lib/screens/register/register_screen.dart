/*
import 'package:expenses/env.dart';
import 'package:expenses/models/register/register_state.dart';
import 'package:expenses/models/register/register_status.dart';
import 'package:expenses/screens/register/register_form.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConnectState<RegisterState>(
      map: (state) => state.registerState,
      where: notIdentical,
      builder: (registerState) {
        print('Rendering Registration Screen');

        if (registerState.registerStatus == RegisterStatus.success) {
          Env.userFetcher.startApp();
          Navigator.pop(context);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: Center(
            child: RegisterForm(),
          ),
        );
      },
    );
  }
}
*/
