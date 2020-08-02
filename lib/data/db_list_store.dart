import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_shopping_list/models/user_list.dart';

const _lists = "lists";

class DbListStore {
  Firestore get _store => Firestore.instance;

  Future<Set<String>> _getListMembers(DocumentReference docRef) async {
    DocumentSnapshot postSnapshot = await docRef.get();
    return Set<String>.from(postSnapshot.data["members"]) ?? Set<String>();
  }

  Stream<List<UserList>> getUserLists(String userId) {
    return _store
        .collection("$_lists/")
        .where("members", arrayContains: userId)
        .snapshots()
        .map((event) => fromQuerySnapshot(event));
  }

  Future<UserList> createList(String userId, String listName) async {
    final key = _store.collection(_lists).document().documentID;
    final newUserList = UserList(
        id: key,
        name: listName,
        order: DateTime.now().millisecondsSinceEpoch,
        members: [userId]);

    _store.document("$_lists/$key").setData(newUserList.toMap());
    return newUserList;
  }

  Future renameList(String listId, String name) async {
    _store
        .document("$_lists/$listId")
        .updateData(<String, dynamic>{"name": name});
  }

  Future addListMember(String listId, String userId) async {
    final docRef = _store.document("$_lists/$listId");
    final members = await _getListMembers(docRef)
      ..add(userId);
    await docRef.updateData(<String, dynamic>{"members": members.toList()});
  }

  Future deleteList(String userId, String listId) async {
    final docRef = _store.document("$_lists/$listId");
    final Set<String> members = await _getListMembers(docRef)
      ..remove(userId);

    if (members.isNotEmpty)
      await docRef.updateData(<String, dynamic>{"members": members.toList()});
    else
      await _store.document("$_lists/$listId").delete();
  }

  Future orderList(Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.document("$_lists/$key");
      batch.updateData(docRef, <String, dynamic>{"order": value});
    });
    batch.commit();
  }

  static List<UserList> fromQuerySnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.documents
          .expand((element) => fromSnapshot(element))
          .toList();
    } catch (e) {
      print(e);
      return List<UserList>();
    }
  }

  static List<UserList> fromSnapshot(DocumentSnapshot listsSnapshot) {
    if (listsSnapshot.exists) {
      return UserList.from(listsSnapshot.data);
    } else {
      return List<UserList>();
    }
  }
}
