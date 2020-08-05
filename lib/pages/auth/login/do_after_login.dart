import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/sort_action_init.dart';

void doOnLoggedIn(Store store) {
  store.dispatch(SortActionInit());
  store.dispatch(NavigateAction<AppState>.pushReplacementNamed("/main"));
}
