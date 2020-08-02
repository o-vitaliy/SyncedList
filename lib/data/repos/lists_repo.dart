import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

import '../db_list_store.dart';

class ListsRepo {
  DbListStore get _store => GetIt.I.get<DbListStore>();

  AuthRepo get _auth => GetIt.I.get<AuthRepo>();

  StreamSubscription _subscription;

  void subscribeLists(Function(List<UserList>) callback) async {
    unsubscribeItems();
    final uid = await _auth.userId();
    _subscription = _store.getUserLists(uid).listen((event) => callback(event));
  }

  void unsubscribeItems() {
    _subscription?.cancel();
    _subscription = null;
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
