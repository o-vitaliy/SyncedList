import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// "Not now" on the lists screen's notifications banner: it stays closed; the
/// account sheet still offers to turn notifications on.
class PushActionDismissBanner extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    await GetIt.I.get<PushRepo>().dismissBanner();
    return state.copyWith(pushBannerDismissed: true);
  }
}
