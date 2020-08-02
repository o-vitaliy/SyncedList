import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/auth_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

import '../db_list_store.dart';

class ListsRepo {
  DbListStore get _store => GetIt.I.get<DbListStore>();

  AuthRepo get _auth => GetIt.I.get<AuthRepo>();

  Future<List<UserList>> getUserLists() async {
    final userId = await _auth.userId();
    return _store.getUserLists(userId);
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
    _store.addList(userId, listId);

    return _store.addListMember(listId, userId);
  }

  Future deleteUserList(UserList userList) async {
    final userId = await _auth.userId();
    await _store.deleteList(userId, userList.id);
  }

  Future orderList(String listId, int order) async {
    return await _store.orderList(listId, order);
  }
}
