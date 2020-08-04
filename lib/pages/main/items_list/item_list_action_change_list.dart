import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

class ItemListActionChangeList extends ReduxAction<AppState> {
  final List<ShoppingItem> items;

  ItemListActionChangeList(this.items);

  @override
  AppState reduce() {
    return state.copyWith(
      itemListState: state.itemListState.copyWith(
        loading: false,
        items: items..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0)),
      ),
    );
  }
}
