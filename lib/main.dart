import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'data/repos/auth_repo.dart';
import 'data/repos/invites_repo.dart';
import 'data/repos/lists_repo.dart';
import 'data/repos/sort_repo.dart';
import 'data/repos/user_lists_repo.dart';
import 'data/sources/auth/auth_datasource.dart';
import 'data/sources/list/db_items_store.dart';
import 'data/sources/list/db_list_store.dart';
import 'data/sources/prefs/prefs_data_source.dart';
import 'firebase_options.dart';
import 'state/app_state.dart';

late Store<AppState> mainStore =
    Store<AppState>(initialState: AppState.initialState());

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencies();

  NavigateAction.setNavigatorKey(navigatorKey);
  runApp(const App());
}

void setupDependencies() {
  getIt.registerSingleton(AuthDataSource());

  getIt.registerSingleton(PrefsDataSource());

  getIt.registerSingleton(DbListStore());
  getIt.registerSingleton(DbItemsStore());

  getIt.registerSingleton(AuthRepo());
  getIt.registerSingleton(ListsRepo());
  getIt.registerSingleton(ItemsListRepo());
  getIt.registerSingleton(InviteRepos());
  getIt.registerSingleton(SortRepo());
}
