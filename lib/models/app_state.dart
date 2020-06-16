
import 'package:expenses/models/auth/auth_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState authState;


  AppState({
    @required this.authState,
  });

  AppState copyWith({
    AuthState authState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
    );
  }

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
    );
  }
}
