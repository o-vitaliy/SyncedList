import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/pages/main/items_list/new_item/new_item_action_change_loading.dart';

import 'new_item_state.dart';

class NewItemActionAddList extends ReduxAction<NewItemState> {
  @override
  void before() => dispatch(NewItemActionChangeLoading(value: true));

  @override
  void after() => dispatch(NewItemActionChangeLoading(value: false));

  @override
  Future<NewItemState> reduce() async {
    final repo = GetIt.I.get<ItemsListRepo>();
    final result = await repo.addItem(state.listId, state.name);
    print("result $result");
    return state.copyWith(savedEvent: Event(result));
  }
}
