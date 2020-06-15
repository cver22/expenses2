import 'package:expenses/models/user/auth_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState authState;


  AppState({
    @required this.authState,
  });

  AppState copyWith({
    AuthState userState,
  }) {
    return AppState(
      authState: userState ?? this.authState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
    );
  }
}
