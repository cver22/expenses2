
import 'package:expenses/models/auth/auth_state.dart';
import 'package:expenses/models/login/login_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState authState;
  final LoginState loginState;


  AppState({
    @required this.authState,
    @required this.loginState,
  });

  AppState copyWith({
    AuthState authState,
    LoginState loginState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      loginState: loginState ?? this.loginState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      loginState: LoginState.initial(),
    );
  }
}
