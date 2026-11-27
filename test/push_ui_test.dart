import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/state/user_list_state.dart';
import 'package:shopping_list/ui/push/notifications_section.dart';
import 'package:shopping_list/ui/push/push_banner.dart';

/// PushRepo without Firebase: a fixed permission, and records what's asked.
class _FakePushRepo extends PushRepo {
  PushPermission current;
  bool? askedWith;
  bool dismissed = false;

  _FakePushRepo(this.current);

  @override
  Future<PushPermission> permission() async => current;

  @override
  Future<PushPermission> enable({required bool ask}) async {
    askedWith = ask;
    if (ask && current == PushPermission.notAsked) {
      current = PushPermission.granted;
    }
    return current;
  }

  @override
  Future<bool> bannerDismissed() async => dismissed;

  @override
  Future<void> dismissBanner() async => dismissed = true;
}

UserList _list({required bool shared}) => UserList(
  id: "1",
  name: "Groceries",
  order: 0,
  members: shared ? ["a", "b"] : ["a"],
);

Store<AppState> _store({
  required PushPermission permission,
  bool shared = true,
}) => Store<AppState>(
  initialState: AppState.initialState().copyWith(
    pushPermission: permission,
    userListState: UserListState(loading: false, list: [_list(shared: shared)]),
  ),
);

Future<void> _pump(WidgetTester tester, Store<AppState> store, Widget child) {
  return tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        localizationsDelegates: appLocalizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    ),
  );
}

void main() {
  tearDown(() => GetIt.I.reset());

  group('PushBanner', () {
    testWidgets('shows for a shared list when not asked yet', (tester) async {
      GetIt.I.registerSingleton<PushRepo>(
        _FakePushRepo(PushPermission.notAsked),
      );
      await _pump(
        tester,
        _store(permission: PushPermission.notAsked),
        const PushBanner(),
      );
      expect(find.text("Turn on"), findsOneWidget);
      expect(find.text("Not now"), findsOneWidget);
    });

    testWidgets('stays hidden without a shared list', (tester) async {
      await _pump(
        tester,
        _store(permission: PushPermission.notAsked, shared: false),
        const PushBanner(),
      );
      expect(find.text("Turn on"), findsNothing);
    });

    testWidgets('stays hidden once permission is decided', (tester) async {
      for (final p in [PushPermission.granted, PushPermission.denied]) {
        await _pump(tester, _store(permission: p), const PushBanner());
        expect(find.text("Turn on"), findsNothing);
      }
    });

    testWidgets('"Turn on" asks, as from a tap', (tester) async {
      final repo = _FakePushRepo(PushPermission.notAsked);
      GetIt.I.registerSingleton<PushRepo>(repo);
      final store = _store(permission: PushPermission.notAsked);
      await _pump(tester, store, const PushBanner());

      await tester.tap(find.text("Turn on"));
      await tester.pumpAndSettle();

      expect(repo.askedWith, isTrue);
      expect(store.state.pushPermission, PushPermission.granted);
      expect(find.text("Turn on"), findsNothing);
    });

    testWidgets('"Not now" hides it for good', (tester) async {
      final repo = _FakePushRepo(PushPermission.notAsked);
      GetIt.I.registerSingleton<PushRepo>(repo);
      final store = _store(permission: PushPermission.notAsked);
      await _pump(tester, store, const PushBanner());

      await tester.tap(find.text("Not now"));
      await tester.pumpAndSettle();

      expect(repo.dismissed, isTrue);
      expect(store.state.pushBannerDismissed, isTrue);
      expect(find.text("Turn on"), findsNothing);
    });
  });

  group('NotificationsSection', () {
    Future<Store<AppState>> show(
      WidgetTester tester,
      _FakePushRepo repo,
    ) async {
      GetIt.I.registerSingleton<PushRepo>(repo);
      final store = _store(permission: PushPermission.unsupported);
      await _pump(tester, store, const NotificationsSection());
      await tester.pumpAndSettle(); // PushActionLoad reads the permission.
      return store;
    }

    testWidgets('offers the button when not asked', (tester) async {
      final repo = _FakePushRepo(PushPermission.notAsked);
      final store = await show(tester, repo);
      expect(find.text("Notifications"), findsOneWidget);

      await tester.tap(find.text("Turn on notifications"));
      await tester.pumpAndSettle();

      expect(repo.askedWith, isTrue);
      expect(store.state.pushPermission, PushPermission.granted);
      expect(find.text("Notifications are on"), findsOneWidget);
    });

    testWidgets('explains a blocked permission', (tester) async {
      await show(tester, _FakePushRepo(PushPermission.denied));
      expect(find.textContaining("Notifications are"), findsOneWidget);
      expect(find.text("Turn on notifications"), findsNothing);
    });

    testWidgets('is hidden where push is unsupported', (tester) async {
      await show(tester, _FakePushRepo(PushPermission.unsupported));
      expect(find.text("Notifications"), findsNothing);
    });
  });
}
