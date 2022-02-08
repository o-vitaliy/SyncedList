import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';

const parts = "=";
const itemsJoint = "&";
const paramsJoint = "?";

const _key = "invites2";

class InviteRepos {
  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  Future<Set<UserList>> _getList() async {
    final String json = (await _prefs.getString(_key)) ?? "[]";

    const decoder = JsonDecoder();
    final items = decoder.convert(json);

    return UserList.from(items).toSet();
  }

  void _saveList(Iterable<UserList> items) {
    final v = items.map((e) => e.toMap()).toList(growable: false);
    const encoder = JsonEncoder();
    _prefs.setString(_key, encoder.convert(v));
  }

  Future<void> saveInvite(String listId, String listName) async {
    final items = (await _getList())
      ..add(UserList(id: listId, name: listName, order: 0, members: []));
    _saveList(items);
  }

  Future<UserList?> first() async {
    final items = await _getList();
    if (items.isNotEmpty) return items.first;
    return null;
  }

  Future remove(String listId) async {
    final items = await _getList();
    items.removeWhere((e) => e.id == listId);
    _saveList(items);
  }
}
