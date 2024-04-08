import 'package:dub_tralers/redux/action.dart';
import 'package:dub_tralers/redux/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action == ReduxActions.incrementAction) {
    return AppState(count: state.count + 1);
  } else if (action == ReduxActions.decrementAction) {
    return AppState(count: state.count - 1);
  }
  return state;
}