part of 'actions.dart';

AppState _updateLogState(
    AppState appState,
    LogsState update(LogsState logsState),
    ) {
  return appState.copyWith(logsState: update(appState.logsState));
}

AppState _updateLogs(
  AppState appState,
  void updateInPlace(Map<String, Log> logs),
) {
  Map<String, Log> cloneMap = Map.from(appState.logsState.logs);
  updateInPlace(cloneMap);
  return _updateLogState(
      appState, (logsState) => logsState.copyWith(logs: cloneMap));
}

class SetLogs implements Action {
  final Iterable<Log> list;

  SetLogs(this.list);

  @override
  AppState updateState(AppState appState) {
    return _updateLogs(appState, (logs) {
      logs.addEntries(list.map((log) => MapEntry(log.id, log)));
    });
  }
}
