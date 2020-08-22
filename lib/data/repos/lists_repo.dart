import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

import '../db_list_store.dart';

class ListsRepo {
  DbListStore get _store => GetIt.I.get<DbListStore>();

  AuthRepo get _auth => GetIt.I.get<AuthRepo>();

  StreamSubscription _subscription;
  final callbacks = Map<Object, Function(List<UserList>)>();
  final observers = Map<Object, int>();

  void subscribeLists(
    Object observer,
    Function(List<UserList>) callback,
  ) async {
    if (callbacks.isEmpty) {
      final uid = await _auth.userId();
      _subscription = _store.getUserLists(uid).listen((event) {
        callbacks.values.forEach((f) => f(event));
      });
    }
    callbacks[observer] = callback;
    observers.update(observer, (v) => v + 1, ifAbsent: () => 1);
  }

  void unsubscribeItems(Object observer) {
    observers.update(observer, (v) => v - 1, ifAbsent: () => 0);

    if (observers[observer] == 0) {
      callbacks.remove(observer);
    }

    if (callbacks.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  Future<UserList> createUserList(String listName) async {
    final userId = await _auth.userId();
    return _store.createList(userId, listName);
  }

  Future saveUserList(String listId, String listName) async {
    return _store.renameList(listId, listName);
  }

  Future addUserList(String listId) async {
    final userId = await _auth.userId();
    return _store.addListMember(listId, userId);
  }

  Future deleteUserList(UserList userList) async {
    final userId = await _auth.userId();
    await _store.deleteList(userId, userList.id);
  }

  Future orderList(Map<String, int> reorders) async {
    return await _store.orderList(reorders);
  }
}
