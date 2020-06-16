import 'package:expenses/models/auth/auth_status.dart';
import 'package:expenses/models/auth/user.dart';
import 'package:expenses/services/user_repository.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/app_store.dart';
import 'package:expenses/utils/maybe.dart';
import 'package:meta/meta.dart';

class Fetcher {
  final AppStore _store;
  final FirebaseUserRepository _userRepository;

  Fetcher({
    @required AppStore store,
    @required FirebaseUserRepository userRepository,
  })  : _store = store,
        _userRepository = userRepository;

  FirebaseUserRepository get repo => _userRepository;

  Future<void> startApp() async {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      final Maybe<User> user = Maybe.some(await _userRepository.getUser());
      _store.dispatch(
          UpdateAuthStatus(user: user, authStatus: AuthStatus.authenticated));
    } else {
      _store.dispatch(UpdateAuthStatus(authStatus: AuthStatus.unauthenticated));
    }
  }


//TODO implement loading of logs and entries from firestore

}
