import 'package:expenses/blocs/login_bloc/login_bloc.dart';
import 'package:expenses/env.dart';
import 'package:expenses/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: Env.fetcher.repo),
        child: LoginForm(userRepository: Env.fetcher.repo),
      ),
    );
  }
}
