import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'data/repos/auth_repo.dart';
import 'data/repos/invites_repo.dart';
import 'data/repos/lists_repo.dart';
import 'data/repos/push_repo.dart';
import 'data/repos/sort_repo.dart';
import 'data/repos/suggestions_repo.dart';
import 'data/repos/theme_repo.dart';
import 'data/repos/user_lists_repo.dart';
import 'data/sources/auth/auth_datasource.dart';
import 'data/sources/list/db_items_store.dart';
import 'data/sources/list/db_list_store.dart';
import 'data/sources/prefs/prefs_data_source.dart';
import 'data/sources/push/push_data_source.dart';
import 'firebase_options.dart';
import 'state/app_state.dart';
import 'ui/account/actions/account_action_changed.dart';
import 'ui/push/push_notifications.dart';
import 'ui/settings/actions/theme_action_load.dart';

Store<AppState> mainStore = Store<AppState>(
  initialState: AppState.initialState(),
);

GetIt getIt = GetIt.instance;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kIsWeb) {
      // Mobile keeps an offline Firestore cache by default; the web doesn't.
      // Keep one in IndexedDB, so the installed web app shows lists offline
      // and syncs edits made offline later. It must be set before Firestore
      // is first used.
      //
      // Single-tab, not multi-tab: with multi-tab sync only one "primary" tab
      // listens to Firestore and the others hear about changes through it.
      // Android Chrome freezes background tabs and installed apps, so a
      // frozen primary held back the visible tab's updates for ~30 s. Now
      // the first tab owns the offline cache and any other tab falls back to
      // a memory cache with its own live listener.
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: true,
        webPersistentTabManager: WebPersistentSingleTabManager(),
      );
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    setupDependencies();
    getIt.get<AuthRepo>().accountChanges().listen(
      (account) => mainStore.dispatch(AccountActionChanged(account)),
    );

    NavigateAction.setNavigatorKey(navigatorKey);
    // Load the saved theme first so the app doesn't flash the wrong one.
    await mainStore.dispatchAndWait(ThemeActionLoad());
    runApp(const App());
    initDeepLinks();
    await initPushNotifications();
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

void setupDependencies() {
  getIt.registerSingleton(AuthDataSource());

  getIt.registerSingleton(PrefsDataSource());

  getIt.registerSingleton(DbListStore());
  getIt.registerSingleton(DbItemsStore());
  getIt.registerSingleton(PushDataSource());

  getIt.registerSingleton(AuthRepo());
  getIt.registerSingleton(ListsRepo());
  getIt.registerSingleton(ItemsListRepo());
  getIt.registerSingleton(InviteRepos());
  getIt.registerSingleton(SortRepo());
  getIt.registerSingleton(SuggestionsRepo());
  getIt.registerSingleton(ThemeRepo());
  getIt.registerSingleton(PushRepo());
}
