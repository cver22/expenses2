import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses/member/member_model/entry_member_model/entry_member.dart';
import 'package:expenses/member/member_model/entry_member_model/entry_member_entity.dart';
import 'package:expenses/utils/db_consts.dart';
import 'package:flutter/foundation.dart';

@immutable
class MyEntryEntity extends Equatable {
  final String uid;
  final String id;
  final String logId;
  final String currency;
  final bool active;
  final String category;
  final String subcategory;
  final int amount;
  final String comment;
  final DateTime dateTime;
  final Map<String, String> tagIDs;
  final Map<String, EntryMember> entryMembers;

  const MyEntryEntity(
      {this.uid,
      this.id,
      this.logId,
      this.currency,
      this.active,
      this.category,
      this.subcategory,
      this.amount,
      this.comment,
      this.dateTime,
      this.tagIDs,
      this.entryMembers});

  @override
  List<Object> get props => [
        uid,
        id,
        logId,
        currency,
        active,
        category,
        subcategory,
        amount,
        comment,
        dateTime,
        tagIDs,
        entryMembers,
      ];

  @override
  String toString() {
    return 'EntryEntity {$UID: $uid, $ID: $id, $LOG_ID: $logId, '
        'currency: $currency, $ACTIVE: $active, $CATEGORY: $category, '
        '$SUBCATEGORY: $subcategory, $AMOUNT: $amount, $COMMENT: $comment'
        '$DATE_TIME: $dateTime, tagIDs: $tagIDs, members: $entryMembers)}';
  }

  static MyEntryEntity fromSnapshot(DocumentSnapshot snap) {
    return MyEntryEntity(
      uid: snap.data[UID],
      id: snap.documentID,
      logId: snap.data[LOG_ID],
      currency: snap.data[CURRENCY_NAME],
      active: snap.data[ACTIVE],
      category: snap.data[CATEGORY],
      subcategory: snap.data[SUBCATEGORY],
      amount: snap.data[AMOUNT],
      comment: snap.data[COMMENT],
      dateTime: DateTime.fromMillisecondsSinceEpoch(snap.data[DATE_TIME]),
      tagIDs: (snap.data[TAGS] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value)),
      entryMembers: (snap.data[MEMBERS] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, EntryMember.fromEntity(EntryMemberEntity.fromJson(value)))),
    );
  }


  Map<String, Object> toDocument() {
    return {
      UID: uid,
      LOG_ID: logId,
      CURRENCY_NAME: currency,
      ACTIVE: active,
      CATEGORY: category,
      SUBCATEGORY: subcategory,
      AMOUNT: amount,
      COMMENT: comment,
      DATE_TIME: dateTime.millisecondsSinceEpoch,
      TAGS: tagIDs.map((key, value) => MapEntry(key, value)),
      MEMBERS: entryMembers.map((key, value) => MapEntry(key, value.toEntity().toJson())),
    };
  }
}
