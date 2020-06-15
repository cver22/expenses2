import 'package:expenses/models/app_tab.dart';
import 'package:expenses/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: ArchSampleKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == AppTab.logs ? Icons.list : Icons.show_chart,
            key: tab == AppTab.logs
                ? ArchSampleKeys.logsTab
                : ArchSampleKeys.entriesTab,
          ),
          title: Text(tab == AppTab.entries
              ? 'Entries'
              : 'Logs'),
        );
      }).toList(),
    );
  }
}