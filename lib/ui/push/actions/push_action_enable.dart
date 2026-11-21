import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// Asks for notification permission and registers for pushes. Dispatched
/// when the user's lists include a shared one, so people who never share
/// aren't asked.
class PushActionEnable extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    await GetIt.I.get<PushRepo>().enable();
    return null;
  }
}
