import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

const _items = "items";
const _products = "products";

class DbItemsStore {
  Firestore get _store => Firestore.instance;

  Stream<List<ShoppingItem>> getItems(String listId) {
    final doc = _store.collection("$_items/$listId/$_products");
    return doc.snapshots().map((s) => fromQuerySnapshot(s));
  }

  Future<ShoppingItem> addItem(String listId, ShoppingItem item) async {
    final id =
        _store.collection("$_items/$listId/$_products").document().documentID;
    final doc = _store.document("$_items/$listId/$_products/$id");
    item = item.copyWith(id: id);
    await doc.setData(item.toMap());

    return item;
  }

  Future doneItem(String listId, String itemId, bool done) async {
    final doc = _store.document("$_items/$listId/$_products/$itemId");
    await doc.updateData(<String, dynamic>{"done": done});
  }

  Future orderItem(String listId, Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.document("$_items/$listId/$_products/$key");
      batch.updateData(docRef, <String, dynamic>{"order": value});
    });
    batch.commit();
  }

  static List<ShoppingItem> fromQuerySnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.documents
          .expand((element) => fromSnapshot(element))
          .toList();
    } catch (e) {
      print(e);
      return List<ShoppingItem>();
    }
  }

  static List<ShoppingItem> fromSnapshot(DocumentSnapshot snapshot) {
    try {
      if (snapshot.exists) {
        return ShoppingItem.from(snapshot.data);
      } else {
        return List<ShoppingItem>();
      }
    } catch (e) {
      print(e);
      return List<ShoppingItem>();
    }
  }
}
