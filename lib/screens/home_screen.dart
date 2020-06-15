import 'package:expenses/env.dart';
import 'package:expenses/models/app_tab.dart';
import 'package:expenses/screens/drawer/app_drawer.dart';
import 'package:expenses/screens/entries/entries_page.dart';
import 'package:expenses/screens/logs/logs_page.dart';
import 'package:expenses/screens/tab_selector.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*return ConnectState<AppTab>(
      map: (state) => state.activeTab,
      where: notIdentical,
      builder: (activeTab) {
        print("Rendering Home Screen");

        return Scaffold(
          appBar: AppBar(
            title: Text("Expense"),
          ),
          body: activeTab == AppTab.logs ? LogsPage() : EntriesPage(),

          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => Env.store.dispatch(SetActiveTab(activeTab: tab)),
          ),
        );
      },
    );*/
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          actions: <Widget>[],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_balance_wallet)),
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.assessment)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LogsPage(),
            EntriesPage(),
            Icon(Icons.assessment),
          ],
        ),
      ),
    );
  }
}
