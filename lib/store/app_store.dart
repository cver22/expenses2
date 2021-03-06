
import 'package:expenses/app/models/app_state.dart';
import 'package:expenses/store/actions/actions.dart';
import 'package:rxdart/rxdart.dart';

class AppStore {
  //stream of current app state
  final BehaviorSubject<AppState> _stateSubject;

  //initializes app state
  AppStore(AppState initialState)
      : _stateSubject = BehaviorSubject.seeded(initialState);

  AppState get state {
    return _stateSubject.value;
  }

  //Observable deprecated
  Stream<AppState> get state$ {
    return _stateSubject;
  }

  void dispatch(Action action) {
    _stateSubject.add(action.updateState(_stateSubject.value));
  }
}
