import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// The user has seen [listId]: the next push for it starts a new running
/// total instead of adding to the old one.
class PushActionMarkSeen extends ReduxAction<AppState> {
  final String listId;

  PushActionMarkSeen(this.listId);

  @override
  AppState? reduce() {
    // Not awaited: offline, the write only completes once back online.
    GetIt.I.get<PushRepo>().markSeen(listId);
    return null;
  }
}
