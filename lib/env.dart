import 'package:expenses/models/app_state.dart';
import 'file:///D:/version-control/flutter/expenses/lib/services/fetcher/fetcher.dart';
import 'package:expenses/services/user_repository.dart';
import 'package:expenses/store/app_store.dart';

class Env {
  static final store = AppStore(AppState.initial());

  static final fetcher = Fetcher(
    store: store,
    userRepository: FirebaseUserRepository(),
  );
}
