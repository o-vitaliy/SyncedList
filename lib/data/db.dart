/*
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

class Db {
  static var _options = Platform.isIOS
      ? const FirebaseOptions(
          apiKey: "AIzaSyD7sN6Whl1uXviK6vLRxygi0UQI7gY9NVQ",
          databaseURL: "https://whattobuy-e3713.firebaseio.com/",
          gcmSenderID: "361380982242",
          googleAppID: "1:361380982242:ios:aa64dabf2b2559c7e29dbb")
      : const FirebaseOptions(
          apiKey: "AIzaSyD7sN6Whl1uXviK6vLRxygi0UQI7gY9NVQ",
          databaseURL: "https://whattobuy-e3713.firebaseio.com/",
          googleAppID: "1:361380982242:android:361f81eb522783d7e29dbb");

  static const itemsList = "shoppingListItems";

  FirebaseDatabase _database;
  final FirebaseApp _app;

  Db._(this._app);

  static Future<Db> create() async {
    final app =
        await FirebaseApp.configure(options: _options, name: "whattobuy-e3713");
    return Db._(app);
  }

  FirebaseDatabase _getFirebaseDatabase() {
    if (_database == null) {
      _database = FirebaseDatabase(app: _app)
        ..setPersistenceEnabled(true)
        ..setPersistenceCacheSizeBytes(10000000);
    }

    return _database;
  }

  DatabaseReference _getListsReference() =>
      _getFirebaseDatabase().reference().child(itemsList);

  Future<ShoppingItem> addItem(String listId, ShoppingItem item) async {
    final newItemRef = _getListsReference().child(listId).push();
    final key = newItemRef.key;
    return saveItem(listId, key, item.copyWith(id: key));
  }

  Future<ShoppingItem> saveItem(
    String listId,
    String key,
    ShoppingItem item,
  ) async {
    await _getListsReference().child(listId).child(key).set(item?.toMap());
    return item;
  }

  Future changeItem(String listId, ShoppingItem item) async {
    return _getListsReference().child(listId).child(item.id).set(item.toMap());
  }

  Stream<Event> getList(String listId) {
    return _getListsReference().child(listId).onValue;
  }
}
*/
