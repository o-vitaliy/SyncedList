import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';
import 'package:shared_shopping_list/pages/auth/login/login_state.dart';
import 'package:shared_shopping_list/pages/auth/singup/register_state.dart';
import 'package:shared_shopping_list/pages/main/items_list/item_list_state.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/item_sort.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_list_state.dart';

/// manage all state of this project
/// auto add new state when using haystack plugin
/// configure the initialize of state
class AppState {
  final LoginState loginState;
  final RegisterState registerState;
  final UserListState userListState;
  final ItemListState itemListState;

  final Event<String> loginToViewList;
  final Event<List<String>> joinedToList;

  final List<ItemSort> sorts;

  AppState({
    @required this.loginState,
    @required this.registerState,
    @required this.loginToViewList,
    @required this.joinedToList,
    @required this.userListState,
    @required this.itemListState,
    @required this.sorts,
  });

  factory AppState.initial() {
    return AppState(
      loginState: null,
      registerState: null,
      userListState: null,
      itemListState: null,
      loginToViewList: Event<String>.spent(),
      joinedToList: Event<List<String>>.spent(),
      sorts: null,
    );
  }

  AppState copyWith({
    LoginState loginState,
    RegisterState registerState,
    UserListState userListState,
    ItemListState itemListState,
    Event<String> loginToViewList,
    Event<List<String>> joinedToList,
    List<ItemSort> sorts,
  }) {
    return new AppState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      loginToViewList: loginToViewList ?? this.loginToViewList,
      joinedToList: joinedToList ?? this.joinedToList,
      userListState: userListState ?? this.userListState,
      itemListState: itemListState ?? this.itemListState,
      sorts: sorts ?? this.sorts,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          registerState == other.registerState &&
          userListState == other.userListState &&
          itemListState == other.itemListState &&
          loginToViewList == other.loginToViewList &&
          joinedToList == other.joinedToList &&
          sorts == other.sorts;

  @override
  int get hashCode =>
      loginState.hashCode ^
      registerState.hashCode ^
      userListState.hashCode ^
      itemListState.hashCode ^
      loginToViewList.hashCode ^
      joinedToList.hashCode ^
      sorts.hashCode;
}
