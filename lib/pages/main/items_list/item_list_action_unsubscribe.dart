import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';

class ItemListActionUnsubscribe extends ReduxAction<AppState> {

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.unsubscribeItems();
    return state.copyWith(itemListState: null);
  }
}
