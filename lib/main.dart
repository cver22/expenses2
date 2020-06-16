import 'package:expenses/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:expenses/models/auth/auth_state.dart';
import 'package:expenses/models/auth/auth_status.dart';
import 'package:expenses/screens/home_screen.dart';
import 'package:expenses/screens/login/login_screen.dart';
import 'package:expenses/screens/splash_screen.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/simple_bloc_delegate.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // allows code before runApp
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnectState<AuthState>(
          map: (state) => state.authState,
          where: notIdentical,
          builder: (authState) {
            print('Rendering Main Screen)');

            if (authState.authStatus == AuthStatus.authenticated) {
              return HomeScreen();
            } else if (authState.authStatus == AuthStatus.unauthenticated) {
              return LoginScreen();
            }
            return SplashScreen();
          }),
    );

    /*MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            final FirebaseLogsRepository _logsRepository =
                FirebaseLogsRepository(user: state.user);
            final FirebaseEntriesRepository _entriesRepository =
                FirebaseEntriesRepository(user: state.user);
            return MultiBlocProvider(
              providers: [
                BlocProvider<LogsBloc>(
                  create: (context) => LogsBloc(logsRepository: _logsRepository)
                    ..add(LoadLogs()),
                ),
                BlocProvider<EntriesBloc>(
                  create: (context) =>
                      EntriesBloc(entriesRepository: _entriesRepository)
                        ..add(LoadEntries()),
                ),
              ],
              child: HomeScreen(),
            );
          }
        },
      ),
    );*/
  }
}
