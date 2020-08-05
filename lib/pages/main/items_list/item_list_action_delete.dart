import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';

class ItemListActionDelete extends ReduxAction<AppState> {
  final ShoppingItem item;

  ItemListActionDelete(this.item);

  @override
  AppState reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();

    repo.deleteItem(state.itemListState.list.id, item.id);

    return null;
  }
}
