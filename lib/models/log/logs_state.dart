import 'dart:collection';
import 'package:expenses/models/log/log.dart';
import 'package:expenses/utils/lens.dart';
import 'package:expenses/utils/maybe.dart';

class LogsState {
  static ILens<LogsState, LinkedHashMap<String, Log>> logsLens = Lens(
    (state) => state.logs,
    (logs) => (state) => state.copyWith(logs: LinkedHashMap.from(logs)),
  );

  final Map<String, Log> logs;
  final Maybe<String>
      selectedLogId; // allows easy passing of which log is currently selected
  final bool isLoading;

  LogsState({
    this.logs,
    this.selectedLogId,
    this.isLoading,
  });

  LogsState copyWith({
    Map<String, Log> logs,
    Maybe<String> selectedLogId,
    bool isLoading,
  }) {
    return LogsState(
      logs: logs ?? this.logs,
      selectedLogId: selectedLogId ?? this.selectedLogId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Maybe<Log> get selectedLog {
    return selectedLogId.map((logId) => this.logs[logId]);
  }

  factory LogsState.initial() {
    return LogsState(
      logs: LinkedHashMap(),
      selectedLogId: Maybe.none(),
      isLoading: false,
    );
  }
}
