import 'package:expenses/services/user_repository.dart';

import 'package:expenses/store/app_store.dart';

class Fetcher {
  final AppStore store;
  final FirebaseUserRepository userRepository;

  Fetcher({
    this.store,
    this.userRepository,
  });

//TODO implement loading of logs and entries from firestore

}
