# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

SyncedList is a Flutter app (Dart package name `shopping_list`) for shared shopping lists that sync in real time through Firebase (Auth, Firestore, Crashlytics, Hosting). Targets Android (`ua.ovi.shared_shopping_list`), iOS and web. Built with Flutter 3.50 / Dart 3.14 (`sdk: ^3.14.0`). Widgets import `package:material_ui/material_ui.dart` / `package:cupertino_ui/cupertino_ui.dart` (the standalone Material/Cupertino packages), not `package:flutter/material.dart`.

## Commands

```bash
flutter pub get
flutter run                      # pick device with -d <id>
flutter analyze                  # lints: package:flutter_lints/flutter.yaml
flutter test                     # all tests
flutter test test/widget_test.dart --plain-name "<test name>"   # single test
flutter build apk / flutter build ios
```

Localization code generation (also runs automatically on `pub get`/build, since `generate: true`):

```bash
flutter gen-l10n
```

Android builds need JDK 17+ (`JAVA_HOME`). The Gradle build is Kotlin DSL (`android/*.gradle.kts`); without `android/keys/key.jks` it signs with the debug key.

Firebase Hosting (landing page, privacy/terms, and the `/.well-known` App Links / Universal Links files) lives in `firebase_hosting/`; deploy from that directory with `firebase deploy --only hosting`.

Tests in `test/` cover only Firebase-free code (share links, translations). Testing `App` itself would need Firebase mocked.

## Architecture

Layering: **UI widgets → async_redux actions → repos → data sources (Firestore / FirebaseAuth / SharedPreferences)**.

- **State management: async_redux.** A single global `mainStore` (`lib/main.dart`) holds an immutable `AppState` (`lib/state/`). State classes use hand-written `copyWith`/`==`/`toMap` inside `//<editor-fold desc="Data Methods">` blocks; keep these in sync when adding fields.
- **One action per file.** Each `ReduxAction<AppState>` sits in an `actions/` folder next to the screen that uses it (e.g. `lib/ui/list/items_list/actions/item_list_action_done.dart`). Business logic lives in `reduce()`; actions call repos directly. Some file names don't match the class inside (files under `ui/list/user_list/actions/` are named `new_list_action_*` but define `UserListAction*` classes).
- **Widgets** use the `StoreConnector` + private `_ViewModel.fromStore` pattern, and subscribe/unsubscribe to Firestore streams through `onInit`/`onDispose` dispatching `*Subscribe`/`*Unsubscribe` actions. Some widgets call `mainStore.dispatch(...)` directly.
- **Dependency injection: get_it.** All data sources and repos are registered as singletons in `setupDependencies()` in `main.dart`; repos and actions resolve them with `GetIt.I.get<T>()`. New repos and sources must be registered there.
- **Realtime sync.** `ListsRepo` and `ItemsListRepo` keep a single `StreamSubscription` and pass snapshots to a callback, which dispatches a "changed" action into the store. Mutating actions (done, reorder, delete) update local state optimistically *and* write to Firestore; the snapshot listener then reconciles. Note that `ItemsListRepo` is defined in `lib/data/repos/user_lists_repo.dart`.
- **Firestore schema** (`lib/data/sources/list/`):
  - `lists/{listId}`: `{id, name, order, members: [uid...]}`. A user's lists are queried with `members arrayContains uid`. Deleting removes the user from `members`, and the doc is deleted only when no members remain.
  - `items/{listId}/products/{itemId}`: `{id, value, order, done}`.
  - Reordering is a batched update of the `order` field.
- **Navigation** uses named routes in `lib/app.dart` (`/`, `/login`, `/main`, `/items`), driven from actions through `NavigateAction` with the global `navigatorKey`. `/items` receives the `UserList` as route arguments. The splash screen dispatches `CheckLoginAction`, which routes to `/login` or `/main`.
- **Auth** (`lib/ui/auth/actions/`): Google, Facebook and anonymous login all extend `BaseLogin`, which wraps `login()` with `WaitAction` (`waitLoginAction`) and turns `FirebaseException` into `UserException`.
- **Sharing / invites.** `Deeplink.createLink` builds `https://syncedlist.web.app/link?id=&name=`, opened in the app through Android App Links / iOS Universal Links (Firebase Dynamic Links was shut down). `initDeepLinks()` in `app.dart` (called from `main`) listens via `app_links` and dispatches `NewListActionFromDeepLink`, which saves the invite to SharedPreferences (`InviteRepos`). If the user is logged in it adds them as a list member right away; otherwise it sets the `loginToViewList` `Event` so the login screen can prompt.
- **Localization** uses Flutter gen-l10n: edit `lib/l10n/app_en.arb` (template) and `app_ru.arb`; `lib/l10n/app_localizations*.dart` are generated, so don't edit them by hand. Access strings with `AppLocalizations.of(context)`. `MaterialApp` must use `appLocalizationsDelegates` from `lib/localization.dart`, not the generated `AppLocalizations.localizationsDelegates`: the generated list's Material delegates come from `flutter_localizations`, which `material_ui`'s `MaterialApp` doesn't recognize, so Russian fails.
- **Item sort preference** (`SortRepo`) is stored in SharedPreferences as a JSON array of `ItemSort` names.
- Errors are reported to Crashlytics through `runZonedGuarded` and `FlutterError.onError` in `main()`.
