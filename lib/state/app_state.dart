import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:give_a_ride/data/entities/item_sort.dart';

import 'item_list_state.dart';
import 'login_state.dart';
import 'user_list_state.dart';

@immutable
class AppState {
  final LoginState loginState;

  final Wait wait;

  final UserListState? userListState;
  final ItemListState? itemListState;

  final Event<String> loginToViewList;
  final Event<List<String>> joinedToList;

  final List<ItemSort>? sorts;

  static AppState initialState() => AppState(
        loginState: LoginState.initialState(),
        wait: Wait(),
        userListState: null,
        itemListState: null,
        sorts: null,
        loginToViewList: Event<String>.spent(),
        joinedToList: Event<List<String>>.spent(),
      );

//<editor-fold desc="Data Methods">

  const AppState({
    required this.loginState,
    required this.wait,
    this.userListState,
    this.itemListState,
    required this.loginToViewList,
    required this.joinedToList,
    this.sorts,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          wait == other.wait &&
          userListState == other.userListState &&
          itemListState == other.itemListState &&
          loginToViewList == other.loginToViewList &&
          joinedToList == other.joinedToList &&
          sorts == other.sorts);

  @override
  int get hashCode =>
      loginState.hashCode ^
      wait.hashCode ^
      userListState.hashCode ^
      itemListState.hashCode ^
      loginToViewList.hashCode ^
      joinedToList.hashCode ^
      sorts.hashCode;

  @override
  String toString() {
    return 'AppState{' +
        ' loginState: $loginState,' +
        ' wait: $wait,' +
        ' userListState: $userListState,' +
        ' itemListState: $itemListState,' +
        ' loginToViewList: $loginToViewList,' +
        ' joinedToList: $joinedToList,' +
        ' sorts: $sorts,' +
        '}';
  }

  AppState copyWith({
    LoginState? loginState,
    Wait? wait,
    UserListState? userListState,
    ItemListState? itemListState,
    Event<String>? loginToViewList,
    Event<List<String>>? joinedToList,
    List<ItemSort>? sorts,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      wait: wait ?? this.wait,
      userListState: userListState ?? this.userListState,
      itemListState: itemListState ?? this.itemListState,
      loginToViewList: loginToViewList ?? this.loginToViewList,
      joinedToList: joinedToList ?? this.joinedToList,
      sorts: sorts ?? this.sorts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loginState': this.loginState,
      'wait': this.wait,
      'userListState': this.userListState,
      'itemListState': this.itemListState,
      'loginToViewList': this.loginToViewList,
      'joinedToList': this.joinedToList,
      'sorts': this.sorts,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      loginState: map['loginState'] as LoginState,
      wait: map['wait'] as Wait,
      userListState: map['userListState'] as UserListState,
      itemListState: map['itemListState'] as ItemListState,
      loginToViewList: map['loginToViewList'] as Event<String>,
      joinedToList: map['joinedToList'] as Event<List<String>>,
      sorts: map['sorts'] as List<ItemSort>,
    );
  }

//</editor-fold>
}
