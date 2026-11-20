import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_list/data/entities/account.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/invites_repo.dart';
import 'package:shopping_list/data/repos/lists_repo.dart';
import 'package:shopping_list/data/sources/auth/auth_datasource.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/account/actions/account_action_link.dart';

class _FakeAuth extends AuthRepo {
  _FakeAuth(this.result);

  final Object result; // a LinkResult, or an exception to throw

  @override
  Future<LinkResult> linkGoogle() async {
    final r = result;
    if (r is LinkResult) return r;
    throw r;
  }
}

class _FakeLists extends ListsRepo {
  final guestLists = [
    UserList(id: 'a', name: 'Groceries', order: 0, members: ['guest']),
    UserList(id: 'b', name: 'Party', order: 1, members: ['guest']),
  ];
  final added = <String>[];
  final failing = <String>{};
  int readCount = 0;

  @override
  Future<List<UserList>> currentUserListsOnce() async {
    readCount++;
    return guestLists;
  }

  @override
  Future addUserList(String listId) async {
    if (failing.contains(listId)) throw Exception('offline');
    added.add(listId);
  }

  @override
  void subscribeLists(Function(List<UserList>) callback) {}

  @override
  void unsubscribeItems() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _FakeLists lists;
  late Store<AppState> store;

  Future<void> setUpWith(Object linkResult) async {
    await GetIt.I.reset();
    SharedPreferences.setMockInitialValues({});
    lists = _FakeLists();
    GetIt.I
      ..registerSingleton(PrefsDataSource())
      ..registerSingleton<AuthRepo>(_FakeAuth(linkResult))
      ..registerSingleton<ListsRepo>(lists)
      ..registerSingleton(InviteRepos());
    store = Store<AppState>(initialState: AppState.initialState());
  }

  tearDown(() => GetIt.I.reset());

  test('linking keeps the guest account, so no lists need moving', () async {
    await setUpWith(LinkResult.linked);
    await store.dispatchAndWait(AccountActionLink(SignInProvider.google));
    expect(lists.added, isEmpty);
    expect(await GetIt.I.get<InviteRepos>().first(), isNull);
  });

  test('switching to an existing account moves every guest list', () async {
    await setUpWith(LinkResult.switchedAccount);
    await store.dispatchAndWait(AccountActionLink(SignInProvider.google));
    expect(lists.added, ['a', 'b']);
    expect(await GetIt.I.get<InviteRepos>().first(), isNull);
  });

  test('a list that fails to move is kept as a pending invite', () async {
    await setUpWith(LinkResult.switchedAccount);
    lists.failing.add('b');
    await store.dispatchAndWait(AccountActionLink(SignInProvider.google));
    expect(lists.added, ['a']);
    final pending = await GetIt.I.get<InviteRepos>().first();
    expect(pending?.id, 'b');
    expect(pending?.name, 'Party');
  });

  test('cancelling sign-in changes nothing', () async {
    await setUpWith(LoginCancelled());
    await store.dispatchAndWait(AccountActionLink(SignInProvider.google));
    expect(lists.added, isEmpty);
    expect(store.state.loginState, AppState.initialState().loginState);
  });

  test('guest lists are read from Firestore before signing in', () async {
    await setUpWith(LinkResult.switchedAccount);
    await store.dispatchAndWait(AccountActionLink(SignInProvider.google));
    expect(lists.readCount, 1);
  });
}
