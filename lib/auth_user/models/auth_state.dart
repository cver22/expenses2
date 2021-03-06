import 'package:expenses/auth_user/models/user.dart';
import 'package:expenses/utils/maybe.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState {
  final Maybe<User> user;
  final bool isLoading;

  AuthState({
    this.user,
    this.isLoading,
  });

  AuthState copyWith({
    Maybe<User> user,
    bool isLoading,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      user: Maybe.none(),
      isLoading: false,
    );
  }
}
