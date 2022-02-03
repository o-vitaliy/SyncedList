import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_a_ride/data/entities/new_shopping_item.dart';
import 'package:give_a_ride/data/entities/shopping_item.dart';

const _items = "items";
const _products = "products";

class DbItemsStore {
  FirebaseFirestore get _store => FirebaseFirestore.instance;

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
    await doc.set(item.toMap());

    return item;
  }

  Future renameItem(String listId, String itemId, String itemName) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.update(<String, dynamic>{"value": itemName});
  }

  Future deleteItem(String listId, String itemId) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.delete();
  }

  Future doneItem(String listId, String itemId, bool done) async {
    final doc = _store.doc("$_items/$listId/$_products/$itemId");
    await doc.update(<String, dynamic>{"done": done});
  }

  Future orderItem(String listId, Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.doc("$_items/$listId/$_products/$key");
      batch.update(docRef, <String, dynamic>{"order": value});
    });
    batch.commit();
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
