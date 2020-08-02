import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/repos/lists_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

import 'new_list_action_change_loading.dart';
import 'new_list_state.dart';

class NewListActionSaveList extends ReduxAction<NewListState> {
  @override
  void before() => dispatch(NewListActionChangeLoading(value: true));

  @override
  void after() {
    dispatch(NewListActionChangeLoading(value: false));
  }

  @override
  Future<NewListState> reduce() async {
    final repo = GetIt.I.get<ListsRepo>();
    if (state.id == null) {
      final result = await repo.createUserList(state.name);
      return state.copyWith(savedEvent: Event<UserList>(result));
    } else {
      await repo.saveUserList(state.id, state.name);
      return state.copyWith(editedEvent: Event<String>(state.name));
    }
  }
}
