import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/sort_repo.dart';
import 'package:shopping_list/state/app_state.dart';

class SortActionInit extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final SortRepo repo = GetIt.I<SortRepo>();
    final sorts = await repo.getList();
    return state.copyWith(sorts: sorts.toList(growable: false));
  }
}
