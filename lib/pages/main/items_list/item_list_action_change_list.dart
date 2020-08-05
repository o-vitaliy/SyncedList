import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/repos/sort_repo.dart';
import 'package:shared_shopping_list/models/shopping_item.dart';
import 'package:shared_shopping_list/pages/main/items_list/sort/item_sort.dart';

class ItemListActionChangeList extends ReduxAction<AppState> {
  final List<ShoppingItem> items;

  ItemListActionChangeList(this.items);

  @override
  Future<AppState> reduce() async {
    final sortRepo = GetIt.I.get<SortRepo>();
    final sort = await sortRepo.getSort();

    List<ShoppingItem> result = items;
    if (sort != null) {
      result = ItemSortHelper.sort(sort, items);
    } else {
      result.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    }

    return state.copyWith(
      itemListState: state.itemListState.copyWith(
        loading: false,
        items: result,
      ),
    );
  }
}
