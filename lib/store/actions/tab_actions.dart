part of 'actions.dart';

class SetActiveTab implements Action {
  final AppTab activeTab;

  SetActiveTab({this.activeTab});

  @override
  AppState updateState(AppState appState) {
    return appState.copyWith(activeTab: activeTab);
  }
}
