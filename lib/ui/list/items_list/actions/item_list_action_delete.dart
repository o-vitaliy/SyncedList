import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:give_a_ride/data/entities/shopping_item.dart';
import 'package:give_a_ride/data/repos/user_lists_repo.dart';
import 'package:give_a_ride/state/app_state.dart';

class ItemListActionDelete extends ReduxAction<AppState> {
  final ShoppingItem item;

  ItemListActionDelete(this.item);

  @override
  AppState? reduce() {
    final repo = GetIt.I.get<ItemsListRepo>();

    repo.deleteItem(state.itemListState!.list.id, item.id);

    return null;
  }
}
