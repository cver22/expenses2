import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/auth_user/models/user.dart';
import 'package:expenses/log/log_model/log.dart';
import 'package:expenses/log/log_model/log_entity.dart';
import 'package:expenses/utils/db_consts.dart';

abstract class LogsRepository {
  Future<void> addNewLog(User user, Log log);

  Stream<List<Log>> loadLogs(User user);

  Future<void> updateLog(User user, Log log);


}

class FirebaseLogsRepository implements LogsRepository {
  final logsCollection = Firestore.instance.collection('logs');

  @override
  Future<void> addNewLog(User user, Log log) {
    return logsCollection.add(log.toEntity().toDocument());
  }

  //TODO need to filter by UID for groups
  @override
  Stream<List<Log>> loadLogs(User user) {
    return logsCollection.where(UID, isEqualTo: user.id).where(ACTIVE, isEqualTo: true).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => Log.fromEntity(LogEntity.fromSnapshot(doc))).toList();
    });
  }

  @override
  Future<void> updateLog(User user, Log update) {
    return logsCollection.document(update.id).updateData(update.toEntity().toDocument());
  }
}
