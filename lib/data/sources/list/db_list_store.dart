import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/state/write_errors.dart';

const _lists = "lists";

class DbListStore {
  FirebaseFirestore get _store => FirebaseFirestore.instance;

  Future<Set<String>> _getListMembers(DocumentReference docRef) async {
    DocumentSnapshot postSnapshot = await docRef.get();
    return Set<String>.from(postSnapshot.get("members") ?? <String>{});
  }

  Stream<List<UserList>> getUserLists(String userId) {
    return FirebaseFirestore.instance
        .collection("$_lists/")
        .where("members", arrayContains: userId)
        .snapshots()
        .map((event) => fromQuerySnapshot(event));
  }

  Future<UserList> createList(String userId, String listName) async {
    final key = _store.collection(_lists).doc().id;
    final newUserList = UserList(
      id: key,
      name: listName,
      order: DateTime.now().millisecondsSinceEpoch,
      members: [userId],
    );

    reportWriteFailure(_store.doc("$_lists/$key").set(newUserList.toMap()));
    return newUserList;
  }

  Future renameList(String listId, String name) async {
    reportWriteFailure(
      _store.doc("$_lists/$listId").update(<String, dynamic>{"name": name}),
    );
  }

  // arrayUnion/arrayRemove are atomic, so concurrent joins and leaves
  // don't overwrite each other's member changes.
  Future addListMember(String listId, String userId) async {
    await _store.doc("$_lists/$listId").update(<String, dynamic>{
      "members": FieldValue.arrayUnion([userId]),
    });
  }

  Future deleteList(String userId, String listId) async {
    final docRef = _store.doc("$_lists/$listId");
    await docRef.update(<String, dynamic>{
      "members": FieldValue.arrayRemove([userId]),
    });
    final members = await _getListMembers(docRef);
    if (members.isEmpty) await docRef.delete();
  }

  Future orderList(Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.doc("$_lists/$key");
      batch.update(docRef, <String, dynamic>{"order": value});
    });
    await batch.commit();
  }

  static List<UserList> fromQuerySnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.expand((element) => fromSnapshot(element)).toList();
    } catch (e) {
      return <UserList>[];
    }
  }

  static List<UserList> fromSnapshot(DocumentSnapshot listsSnapshot) {
    if (listsSnapshot.exists) {
      return UserList.from(listsSnapshot.data());
    } else {
      return <UserList>[];
    }
  }
}
