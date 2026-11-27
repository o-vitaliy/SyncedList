import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/suggestions_repo.dart';

import 'new_item_state.dart';

/// Loads the item names to suggest while adding an item.
class NewItemActionLoadHistory extends ReduxAction<NewItemState> {
  @override
  Future<NewItemState> reduce() async {
    final history = await GetIt.I.get<SuggestionsRepo>().getHistory();
    return state.copyWith(history: history);
  }
}
