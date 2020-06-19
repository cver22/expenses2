import 'package:expenses/blocs/register_bloc/bloc.dart';
import 'package:expenses/models/auth/auth_state.dart';
import 'package:expenses/models/auth/auth_status.dart';
import 'package:expenses/screens/register/register_form.dart';
import 'package:expenses/services/user_repository.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final FirebaseUserRepository _userRepository;

  const RegisterScreen({Key key, FirebaseUserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectState<AuthState>(
      map: (state) => state.authState,
      where: notIdentical,
      builder: (authState) {
        print('Rendering Registration Screen');

        if (authState.authStatus == AuthStatus.authenticated) {
          Navigator.pop(context);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: Center(
            child: BlocProvider<RegisterBloc>(
              create: (context) =>
                  RegisterBloc(userRepository: _userRepository),
              child: RegisterForm(),
            ),
          ),
        );
      },
    );
  }
}
