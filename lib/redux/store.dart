import 'package:dub_tralers/redux/app_state.dart';
import 'package:dub_tralers/redux/reducer.dart';
import 'package:redux/redux.dart';

final initialState = AppState.initial();

final Store<AppState> store = Store<AppState>(
  reducer,
  initialState: initialState,
);