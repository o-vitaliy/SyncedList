import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/auth/auth_datasource.dart';

import 'app.dart';
import 'state/app_state.dart';
import 'firebase_options.dart';

late Store<AppState> store;

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencies();

  NavigateAction.setNavigatorKey(navigatorKey);
  var state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(const App());
}

void setupDependencies() {
  getIt.registerSingleton(AuthDataSource());
}
