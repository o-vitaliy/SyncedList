import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:give_a_ride/data/entities/user_list.dart';

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
        members: [userId]);

    _store.doc("$_lists/$key").set(newUserList.toMap());
    return newUserList;
  }

  Future renameList(String listId, String name) async {
    _store.doc("$_lists/$listId").update(<String, dynamic>{"name": name});
  }

  Future addListMember(String listId, String userId) async {
    final docRef = _store.doc("$_lists/$listId");
    final members = await _getListMembers(docRef)
      ..add(userId);
    await docRef.update(<String, dynamic>{"members": members.toList()});
  }

  Future deleteList(String userId, String listId) async {
    final docRef = _store.doc("$_lists/$listId");
    final Set<String> members = await _getListMembers(docRef)
      ..remove(userId);

    if (members.isNotEmpty) {
      await docRef.update(<String, dynamic>{"members": members.toList()});
    } else {
      await _store.doc("$_lists/$listId").delete();
    }
  }

  Future orderList(Map<String, int> reorders) async {
    final batch = _store.batch();

    reorders.forEach((key, value) {
      final docRef = _store.doc("$_lists/$key");
      batch.update(docRef, <String, dynamic>{"order": value});
    });
    batch.commit();
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
