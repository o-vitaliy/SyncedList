import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'app_state.dart';

late Store<AppState> store;

void main() {
  NavigateAction.setNavigatorKey(navigatorKey);
  var state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(const App());
}
