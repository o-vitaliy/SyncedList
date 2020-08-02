import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

import 'item_list_state.dart';

class ItemListActionChangeList extends ReduxAction<ItemListState> {
  final List<ShoppingItem> items;

  ItemListActionChangeList(this.items);

  @override
  ItemListState reduce() {
    return state.copyWith(
      loading: false,
      items: items..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0)),
    );
  }
}
