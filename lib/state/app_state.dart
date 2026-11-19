import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_list/data/entities/item_sort.dart';

import 'item_list_state.dart';
import 'login_state.dart';
import 'user_list_state.dart';

@immutable
class AppState {
  final LoginState loginState;

  final UserListState? userListState;
  final ItemListState? itemListState;

  final Event<String> loginToViewList;
  final Event<List<String>> joinedToList;

  final List<ItemSort>? sorts;

  static AppState initialState() => AppState(
    loginState: LoginState.initialState(),
    userListState: null,
    itemListState: null,
    sorts: null,
    loginToViewList: Event<String>.spent(),
    joinedToList: Event<List<String>>.spent(),
  );

  //<editor-fold desc="Data Methods">

  const AppState({
    required this.loginState,
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
          userListState == other.userListState &&
          itemListState == other.itemListState &&
          loginToViewList == other.loginToViewList &&
          joinedToList == other.joinedToList &&
          sorts == other.sorts);

  @override
  int get hashCode =>
      loginState.hashCode ^
      userListState.hashCode ^
      itemListState.hashCode ^
      loginToViewList.hashCode ^
      joinedToList.hashCode ^
      sorts.hashCode;

  @override
  String toString() {
    return 'AppState{'
        ' loginState: $loginState,'
        ' userListState: $userListState,'
        ' itemListState: $itemListState,'
        ' loginToViewList: $loginToViewList,'
        ' joinedToList: $joinedToList,'
        ' sorts: $sorts,'
        '}';
  }

  AppState copyWith({
    LoginState? loginState,
    UserListState? userListState,
    ItemListState? itemListState,
    Event<String>? loginToViewList,
    Event<List<String>>? joinedToList,
    List<ItemSort>? sorts,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      userListState: userListState ?? this.userListState,
      itemListState: itemListState ?? this.itemListState,
      loginToViewList: loginToViewList ?? this.loginToViewList,
      joinedToList: joinedToList ?? this.joinedToList,
      sorts: sorts ?? this.sorts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loginState': loginState,
      'userListState': userListState,
      'itemListState': itemListState,
      'loginToViewList': loginToViewList,
      'joinedToList': joinedToList,
      'sorts': sorts,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      loginState: map['loginState'] as LoginState,
      userListState: map['userListState'] as UserListState,
      itemListState: map['itemListState'] as ItemListState,
      loginToViewList: map['loginToViewList'] as Event<String>,
      joinedToList: map['joinedToList'] as Event<List<String>>,
      sorts: map['sorts'] as List<ItemSort>,
    );
  }

  //</editor-fold>
}
