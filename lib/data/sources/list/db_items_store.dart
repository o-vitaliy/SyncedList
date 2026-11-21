import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/data/entities/new_shopping_item.dart';
import 'package:shopping_list/data/entities/shopping_item.dart';

const _items = "items";
const _products = "products";

class DbItemsStore {
  FirebaseFirestore get _store => FirebaseFirestore.instance;

  /// Written with every add, rename and check-off, so the push notification
  /// function (functions/src/index.ts) knows who changed the item and
  /// doesn't notify them about their own changes.
  Map<String, dynamic> get _author => <String, dynamic>{
    "updatedBy": FirebaseAuth.instance.currentUser?.uid,
  };

  Stream<List<ShoppingItem>> getItems(String listId) {
    final doc = _store.collection("$_items/$listId/$_products");
    return doc.snapshots().map((s) => fromQuerySnapshot(s));
  }

  Future<ShoppingItem> addItem(String listId, NewShoppingItem newItem) async {
    final id = _store.collection("$_items/$listId/$_products").doc().id;
    final doc = _store.doc("$_items/$listId/$_products/$id");
    final item = ShoppingItem(
      id: id,
      value: newItem.value,
      order: newItem.order,
      done: newItem.done,
    );
    await doc.set({...item.toMap(), ..._author});

    return item;
  }

  Future renameItem(String listId, String itemId, String itemName) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.update(<String, dynamic>{"value": itemName, ..._author});
  }

  Future deleteItem(String listId, String itemId) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.delete();
  }

  Future doneItem(String listId, String itemId, bool done) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.update(<String, dynamic>{"done": done, ..._author});
  }

  Future orderItem(String listId, Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.doc("$_items/$listId/$_products/$key");
      batch.update(docRef, <String, dynamic>{"order": value});
    });
    await batch.commit();
  }

  static List<ShoppingItem> fromQuerySnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.expand((element) => fromSnapshot(element)).toList();
    } catch (e) {
      return <ShoppingItem>[];
    }
  }

  static List<ShoppingItem> fromSnapshot(DocumentSnapshot snapshot) {
    try {
      if (snapshot.exists) {
        return ShoppingItem.from(snapshot.data());
      } else {
        return <ShoppingItem>[];
      }
    } catch (e) {
      return <ShoppingItem>[];
    }
  }
}
