import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

import '../db_items_store.dart';

class ItemsListRepo {
  DbItemsStore get _store => GetIt.I.get<DbItemsStore>();

  StreamSubscription _subscription;

  Future<ShoppingItem> addItem(String listId, String itemName) async {
    final item = ShoppingItem(value: itemName, done: false, order: 0);
    return _store.addItem(listId, item);
  }

  Future renameItem(String listId, String id, String name) async {
    return _store.renameItem(listId, id, name);
  }
  Future deleteItem(String listId, String id) async {
    return _store.deleteItem(listId, id);
  }

  void subscribeItems(String id, Function(List<ShoppingItem>) callback) {
    unsubscribeItems();
    _subscription = _store.getItems(id).listen((event) => callback(event));
  }

  void unsubscribeItems() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future changeItemDone(String listId, String id, bool done) async {
    return _store.doneItem(listId, id, done);
  }

  Future orderItem(String listId, Map<String, int> reorders) async {
    return _store.orderItem(listId, reorders);
  }
}
