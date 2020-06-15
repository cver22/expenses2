
import 'package:expenses/models/app_tab.dart';
import 'package:expenses/models/log/logs_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AppTab activeTab;
  final LogsState logsState;

  AppState({
    @required this.activeTab,
    @required this.logsState,
  });

  AppState copyWith({
    AppTab activeTab,
    LogsState logsState,
  }) {
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      logsState: logsState ?? this.logsState,
    );
  }

  factory AppState.initial() {
    return AppState(
      activeTab: AppTab.logs,
      logsState: LogsState.initial(),
    );
  }
}
