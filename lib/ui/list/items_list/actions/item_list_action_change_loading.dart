import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/state/app_state.dart';

class ItemListActionChangeLoading extends ReduxAction<AppState> {
  final bool value;

  ItemListActionChangeLoading(this.value);

  @override
  AppState reduce() {
    final itemsState = state.itemListState!;
    return state.copyWith(
      itemListState: itemsState.copyWith(
        loading: value,
      ),
    );
  }
}
