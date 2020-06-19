part of 'actions.dart';

class UpdateLoginState implements Action {
  final LoginState loginState;

  UpdateLoginState({this.loginState});

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(loginState: loginState);
  }
}

class PasswordValidation implements Action {
  final String password;

  PasswordValidation(this.password);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(
        loginState: appState.loginState.updateCredentials(
            isPasswordValid: Validators.isValidPassword(password)));
  }
}

class EmailValidation implements Action {
  final String email;

  EmailValidation(this.email);

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(
        loginState: appState.loginState.updateCredentials(
            isPasswordValid: Validators.isValidEmail(email)));
  }
}
