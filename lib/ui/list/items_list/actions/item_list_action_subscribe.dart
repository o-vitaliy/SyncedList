import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:give_a_ride/state/item_list_state.dart';

import 'item_list_action_change_list.dart';

class ItemListActionSubscribe extends ReduxAction<AppState> {
  final UserList args;

  ItemListActionSubscribe(this.args);

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();
    repo.subscribeItems(
      args.id,
      (items) => dispatch(ItemListActionChangeList(items)),
    );

    return state.copyWith(itemListState: ItemListState.initial(args));
  }
}
