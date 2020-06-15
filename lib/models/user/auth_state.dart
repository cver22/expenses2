import 'package:expenses/models/user/user.dart';
import 'package:expenses/utils/maybe.dart';

class AuthState {
  final Maybe<User> user;
  final bool isAuthenticated;

  AuthState({this.user, this.isAuthenticated});

  AuthState copyWith({
  Maybe<User> user,
    bool isAuthenticated,
}){
    return AuthState(
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      user: Maybe.none(),
      isAuthenticated: false,
    );
  }


}