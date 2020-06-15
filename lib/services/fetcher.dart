import 'dart:async';

import 'package:expenses/models/log/log.dart';
import 'package:expenses/services/logs_repository.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/app_store.dart';

class Fetcher {
  final AppStore store;
  final LogsRepository logsRepo;

  Fetcher({
    this.store,
    this.logsRepo,
  });

  Future<void> loadLogs(){

    _logsSubscription?.cancel();
    return logsRepo.loadLogs().listen(
          (logs) => store.dispatch(SetTodos(entities.map(Todo.fromEntity)))),


    //TODO how to load the logs stream

  }


//TODO implement loading of logs and entries from firestore

}
