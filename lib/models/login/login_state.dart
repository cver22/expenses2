import 'package:expenses/models/login/login_status.dart';
import 'package:meta/meta.dart';

// empty is the initial state of the LoginForm.
// loading is the state of the LoginForm when we are validating credentials
// failure is the state of the LoginForm when a login attempt has failed.
// success is the state of the LoginForm when a login attempt has succeeded.

@immutable
class LoginState {
  final LoginStatus loginStatus;
  final bool isEmailValid;
  final bool isPasswordValid;


  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
    @required this.loginStatus,
    @required this.isEmailValid,
    @required this.isPasswordValid,
  });

  factory LoginState.initial() {
    return LoginState(
      loginStatus: LoginStatus.initial,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory LoginState.submitting() {
    return LoginState(
      loginStatus: LoginStatus.submitting,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      loginStatus: LoginStatus.failure,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  factory LoginState.success() {
    return LoginState(
      loginStatus: LoginStatus.success,
      isEmailValid: true,
      isPasswordValid: true,
    );
  }

  LoginState updateCredentials({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      loginStatus: LoginStatus.updated,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,

    );
  }

  LoginState copyWith({
    LoginStatus loginStatus,
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }

  @override
  String toString() {
    return '''{LoginState {
    loginStatus: $loginStatus,
    isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      }''';
  }
}