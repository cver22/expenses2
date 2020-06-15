

import 'package:expenses/models/app_state.dart';
import 'package:expenses/models/app_tab.dart';
import 'package:expenses/models/log/log.dart';
import 'package:expenses/models/log/logs_state.dart';

part 'tab_actions.dart';
part 'log_actions.dart';

abstract class Action {
  AppState updateState(AppState appState);
}