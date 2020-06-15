import 'package:expenses/models/app_state.dart';
import 'package:expenses/services/fetcher.dart';

import 'package:expenses/store/app_store.dart';


class Env {
  static final store = AppStore(AppState.initial());

  static final fetcher = Fetcher(
      store: store,

      );
  //TODO implement fetcher for log and entry repository
}