import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';

void doOnLoggedIn(Store store) {
  store.dispatch(NavigateAction<AppState>.pushReplacementNamed("/main"));
}
