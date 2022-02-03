import 'package:flutter/foundation.dart';
import 'package:give_a_ride/data/entities/user_list.dart';

@immutable
class UserListState {
  final bool loading;
  final List<UserList> list;

  factory UserListState.initial() {
    return const UserListState(loading: true, list: []);
  }

//<editor-fold desc="Data Methods">

  const UserListState({
    required this.loading,
    required this.list,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserListState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          list == other.list);

  @override
  int get hashCode => loading.hashCode ^ list.hashCode;

  @override
  String toString() {
    return 'UserListState{' + ' loading: $loading,' + ' list: $list,' + '}';
  }

  UserListState copyWith({
    bool? loading,
    List<UserList>? list,
  }) {
    return UserListState(
      loading: loading ?? this.loading,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loading': this.loading,
      'list': this.list,
    };
  }

  factory UserListState.fromMap(Map<String, dynamic> map) {
    return UserListState(
      loading: map['loading'] as bool,
      list: map['list'] as List<UserList>,
    );
  }

//</editor-fold>
}
