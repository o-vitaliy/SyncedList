import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_shopping_list/models/user_list.dart';

const _userList = "user_list";
const _lists = "lists";

class DbListStore {
  Firestore get _store => Firestore.instance;

  Future<Set<String>> _getListIds(String userId) async {
    final userListSnapshot = await _store.document("$_userList/$userId").get();
    if (userListSnapshot.exists && userListSnapshot.data.containsKey(_lists)) {
      final v = userListSnapshot.data[_lists];
      return v != null ? Set<String>.from(v) : Set<String>();
    } else {
      return Set<String>();
    }
  }

  Future<Set<String>> _getListMembers(DocumentReference docRef) async {
    DocumentSnapshot postSnapshot = await docRef.get();
    return Set<String>.from(postSnapshot.data["members"]) ?? Set<String>();
  }

  Future<List<UserList>> getUserLists(String userId) async {
    /* final listIds = await _getListIds(userId);

    if (listIds.isEmpty) return List<UserList>();*/

    final d = await _store
        .collection("$_lists/")
        .where("members", arrayContains: userId)
        .getDocuments();

    final List<UserList> r =
        d.documents.expand((d) => fromSnapshot(d)).toList();

    print(r);

    return r;
  }

  Future<UserList> createList(String userId, String listName) async {
    final key = _store.collection("$_userList/$userId").document().documentID;
    final newUserList = UserList(
        id: key,
        name: listName,
        order: DateTime.now().millisecondsSinceEpoch,
        members: [userId]);

    addList(userId, key);
    final docRef = _store.document("$_lists/$key");
    await Firestore.instance.runTransaction((Transaction tx) async {
      await tx.set(docRef, newUserList.toMap());
    });

    return newUserList;
  }

  Future addList(String userId, String listId) async {
    final listIds = await _getListIds(userId)
      ..add(listId);
    final docRef = _store.document("$_userList/$userId");

    await Firestore.instance.runTransaction((Transaction tx) async {
      await tx.set(docRef, <String, dynamic>{_lists: listIds.toList()});
    });
  }

  Future renameList(String listId, String name) async {
    final docRef = _store.document("$_lists/$listId");
    return Firestore.instance.runTransaction((Transaction tx) async {
      tx.update(docRef, <String, dynamic>{"name": name});
    });
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

    final listIds = await _getListIds(userId)
      ..remove(listId);
    final userDofRef = _store.document("$_userList/$userId");
    if (listIds.isNotEmpty) {
      await userDofRef.updateData(<String, dynamic>{_lists: listIds.toList()});
    } else {
      await userDofRef.delete();
    }
  }

  Future orderList(String listId, int order) async {
    final docRef = _store.document("$_lists/$listId");
    return Firestore.instance.runTransaction((Transaction tx) async {
      tx.update(docRef, <String, dynamic>{"order": order});
    });
  }

  static List<UserList> fromSnapshot(DocumentSnapshot listsSnapshot) {
    if (listsSnapshot.exists) {
      return UserList.from(listsSnapshot.data);
    } else {
      return List<UserList>();
    }
  }
}
