import 'package:expenses/blocs/login_bloc/bloc.dart';
import 'package:expenses/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(
        FontAwesomeIcons.google,
        color: Colors.white,
      ),
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      onPressed: () {
        Env.userFetcher.signInWithGoogle();
      },
    );
  }
}
