import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class ItemListActionUnsubscribe extends ReduxAction<AppState> {

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.unsubscribeItems();
    return state.copyWith(itemListState: null);
  }
}
