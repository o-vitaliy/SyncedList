import 'package:async_redux/async_redux.dart';

import 'item_list_state.dart';

class ItemListActionChangeLoading extends ReduxAction<ItemListState> {
  final bool value;

  ItemListActionChangeLoading(this.value);

  @override
  ItemListState reduce() {
    return state.copyWith(loading: value);
  }
}
