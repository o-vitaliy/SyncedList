import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_list/data/entities/app_theme_mode.dart';
import 'package:shopping_list/data/entities/item_sort.dart';
import 'package:shopping_list/data/entities/push_permission.dart';

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

  final AppThemeMode themeMode;

  final PushPermission pushPermission;

  /// The user closed the "turn on notifications" banner on the lists screen.
  final bool pushBannerDismissed;

  static AppState initialState() => AppState(
    loginState: LoginState.initialState(),
    userListState: null,
    itemListState: null,
    sorts: null,
    loginToViewList: Event<String>.spent(),
    joinedToList: Event<List<String>>.spent(),
    themeMode: AppThemeMode.system,
    pushPermission: PushPermission.unsupported,
    pushBannerDismissed: false,
  );

  //<editor-fold desc="Data Methods">

  const AppState({
    required this.loginState,
    this.userListState,
    this.itemListState,
    required this.loginToViewList,
    required this.joinedToList,
    this.sorts,
    required this.themeMode,
    this.pushPermission = PushPermission.unsupported,
    this.pushBannerDismissed = false,
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
          sorts == other.sorts &&
          themeMode == other.themeMode &&
          pushPermission == other.pushPermission &&
          pushBannerDismissed == other.pushBannerDismissed);

  @override
  int get hashCode =>
      loginState.hashCode ^
      userListState.hashCode ^
      itemListState.hashCode ^
      loginToViewList.hashCode ^
      joinedToList.hashCode ^
      sorts.hashCode ^
      themeMode.hashCode ^
      pushPermission.hashCode ^
      pushBannerDismissed.hashCode;

  @override
  String toString() {
    return 'AppState{'
        ' loginState: $loginState,'
        ' userListState: $userListState,'
        ' itemListState: $itemListState,'
        ' loginToViewList: $loginToViewList,'
        ' joinedToList: $joinedToList,'
        ' sorts: $sorts,'
        ' themeMode: $themeMode,'
        ' pushPermission: $pushPermission,'
        ' pushBannerDismissed: $pushBannerDismissed,'
        '}';
  }

  AppState copyWith({
    LoginState? loginState,
    UserListState? userListState,
    ItemListState? itemListState,
    Event<String>? loginToViewList,
    Event<List<String>>? joinedToList,
    List<ItemSort>? sorts,
    AppThemeMode? themeMode,
    PushPermission? pushPermission,
    bool? pushBannerDismissed,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      userListState: userListState ?? this.userListState,
      itemListState: itemListState ?? this.itemListState,
      loginToViewList: loginToViewList ?? this.loginToViewList,
      joinedToList: joinedToList ?? this.joinedToList,
      sorts: sorts ?? this.sorts,
      themeMode: themeMode ?? this.themeMode,
      pushPermission: pushPermission ?? this.pushPermission,
      pushBannerDismissed: pushBannerDismissed ?? this.pushBannerDismissed,
    );
  }

  /// [copyWith] can't set a field to null, so clearing the open list needs this.
  AppState withoutItemList() => AppState(
    loginState: loginState,
    userListState: userListState,
    itemListState: null,
    loginToViewList: loginToViewList,
    joinedToList: joinedToList,
    sorts: sorts,
    themeMode: themeMode,
    pushPermission: pushPermission,
    pushBannerDismissed: pushBannerDismissed,
  );

  /// State after sign-out: no user data, but keep device preferences.
  AppState signedOut() => AppState(
    loginState: const LoginState(authorized: false),
    loginToViewList: Event<String>.spent(),
    joinedToList: Event<List<String>>.spent(),
    sorts: sorts,
    themeMode: themeMode,
    pushPermission: pushPermission,
    pushBannerDismissed: pushBannerDismissed,
  );

  Map<String, dynamic> toMap() {
    return {
      'loginState': loginState,
      'userListState': userListState,
      'itemListState': itemListState,
      'loginToViewList': loginToViewList,
      'joinedToList': joinedToList,
      'sorts': sorts,
      'themeMode': themeMode,
      'pushPermission': pushPermission,
      'pushBannerDismissed': pushBannerDismissed,
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
      themeMode: map['themeMode'] as AppThemeMode,
      pushPermission: map['pushPermission'] as PushPermission,
      pushBannerDismissed: map['pushBannerDismissed'] as bool,
    );
  }

  //</editor-fold>
}
