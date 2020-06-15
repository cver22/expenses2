

import 'package:expenses/models/app_state.dart';



part 'user_actions.dart';

abstract class Action {
  AppState updateState(AppState appState);
}