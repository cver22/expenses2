import 'package:expenses/env.dart';
import 'package:expenses/models/log/log.dart';
import 'package:expenses/models/settings/settings_state.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:expenses/store/app_store.dart';
import 'package:expenses/store/connect_state.dart';
import 'package:expenses/utils/utils.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectState<SettingsState>(
        where: notIdentical,
        map: (state) => state.settingsState,
        builder: (settingsState) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Settings'),
            ),
            body: Column(
              children: <Widget>[
                _logNameDropDown(settingsState: settingsState),
              ],
            ),
          );
        });
  }

  Widget _logNameDropDown({SettingsState settingsState}) {
    AppStore _store = Env.store;
    if (_store.state.logsState.logs.isNotEmpty) {
      Map<String, Log> _logsMap = _store.state.logsState.logs;
      List<Log> _logs = _logsMap.entries.map((e) => e.value).toList();

      String _defaultLogId = settingsState.settings.defaultLogId;

      if (_defaultLogId == null && !_logsMap.containsKey(_defaultLogId)) {
        _defaultLogId = _logs.first.id;
      }

      return DropdownButton<Log>(
        //TODO order preference logs and set default to first log if not navigating from the log itself
        value: _logs.firstWhere((e) => e.id == _defaultLogId),
        onChanged: (Log log) {
          _defaultLogId = log.id;
          _store.dispatch(UpdateSettings(
              settings: settingsState.settings
                  .copyWith(defaultLogId: _defaultLogId)));
        },
        items: _logs.map((Log log) {
          return DropdownMenuItem<Log>(
            value: log,
            child: Text(
              log.logName,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      );
    } else {
      return Container();
    }
  }
}
