import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/sources/auth/auth_datasource.dart';
import 'package:shopping_list/data/sources/list/db_list_store.dart';

class ListsRepo {
  DbListStore get _store => GetIt.I.get<DbListStore>();

  AuthDataSource get _auth => GetIt.I.get<AuthDataSource>();

  StreamSubscription? _subscription;

  void subscribeLists(Function(List<UserList>) callback) async {
    unsubscribeItems();
    String uid = _auth.userId()!;
    _subscription = _store.getUserLists(uid).listen((event) => callback(event));
  }

  void unsubscribeItems() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<UserList> createUserList(String listName) async {
    final userId = _auth.userId()!;
    return _store.createList(userId, listName);
  }

  Future saveUserList(String listId, String listName) async {
    return _store.renameList(listId, listName);
  }

  Future addUserList(String listId) async {
    final userId = _auth.userId()!;
    return _store.addListMember(listId, userId);
  }

  Future deleteUserList(UserList userList) async {
    final userId = _auth.userId()!;
    await _store.deleteList(userId, userList.id);
  }

  Future orderList(Map<String, int> reorders) async {
    return await _store.orderList(reorders);
  }
}
