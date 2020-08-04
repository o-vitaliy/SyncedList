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

  AppState({
    @required this.loginState,
    @required this.registerState,
    @required this.loginToViewList,
    @required this.joinedToList,
    @required this.userListState,
    @required this.itemListState,
  });

  factory AppState.initial() {
    return AppState(
      loginState: null,
      registerState: null,
      userListState: null,
      itemListState: null,
      loginToViewList: Event<String>.spent(),
      joinedToList: Event<List<String>>.spent(),
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
    );
  }
}
