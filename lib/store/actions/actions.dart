

import 'package:expenses/models/app_state.dart';
import 'package:expenses/models/auth/auth_status.dart';
import 'package:expenses/models/auth/user.dart';
import 'package:expenses/utils/maybe.dart';



part 'user_actions.dart';

abstract class Action {
  AppState updateState(AppState appState);
}