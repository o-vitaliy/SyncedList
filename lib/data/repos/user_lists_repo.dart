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

  void subscribeItems(String id, Function(List<ShoppingItem>) callback) {
    unsubscribeItems();
    _subscription = _store.getItems(id).listen((event) => callback(event));
  }

  void unsubscribeItems() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future changeItemDone(String listId, ShoppingItem item, bool done) async {
    item = item.copyWith(done: done);
    return _store.doneItem(listId, item.id, done);
  }

  Future orderItem(String listId, Map<String, int> reorders) async {
    return await _store.orderItem(listId, reorders);
  }
}
