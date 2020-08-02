import 'package:flutter/foundation.dart';
import 'package:shared_shopping_list/models/user_list.dart';

@immutable
class UserListState {
  final bool loading;
  final List<UserList> list;

  factory UserListState.initial() {
    return UserListState(loading: true, list: []);
  }

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const UserListState({
    @required this.loading,
    @required this.list,
  });

  UserListState copyWith({
    bool loading,
    List<UserList> list,
  }) {
    if ((loading == null || identical(loading, this.loading)) &&
        (list == null || identical(list, this.list))) {
      return this;
    }

    return new UserListState(
      loading: loading ?? this.loading,
      list: list ?? this.list,
    );
  }

  @override
  String toString() {
    return 'UserListState{loading: $loading, list: $list}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserListState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          list == other.list);

  @override
  int get hashCode => loading.hashCode ^ list.hashCode;

  factory UserListState.fromMap(Map<String, dynamic> map) {
    return new UserListState(
      loading: map['loading'] as bool,
      list: map['list'] as List<UserList>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'loading': this.loading,
      'list': this.list,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
