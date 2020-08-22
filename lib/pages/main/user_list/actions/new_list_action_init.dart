import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/pages/main/user_list/user_list_state.dart';

class UserListActionInit extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    if (state.itemListState == null)
      return state.copyWith(userListState: UserListState.initial());
    else
      return null;
  }
}
