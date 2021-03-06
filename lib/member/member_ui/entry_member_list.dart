import 'package:expenses/log/log_model/log.dart';
import 'package:expenses/member/member_model/entry_member_model/entry_member.dart';
import 'package:expenses/member/member_ui/entry_member_list_tile.dart';
import 'package:expenses/utils/db_consts.dart';
import 'package:flutter/material.dart';

class EntryMembersListView extends StatelessWidget {

  final Map<String, EntryMember> members;
  final Log log;
  final PaidOrSpent paidOrSpent;

  const EntryMembersListView({Key key, @required this.members, @required this.log, @required this.paidOrSpent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EntryMember> membersList = members.values.toList();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: membersList.length,
      itemBuilder: (BuildContext context, int index) {
        final EntryMember member = membersList[index];
        return EntryMemberListTile(member: member, name: log.logMembers[member.uid].name, paidOrSpent: paidOrSpent);
      },
    );
  }
}

