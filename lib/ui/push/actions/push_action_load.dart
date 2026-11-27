import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// Reads the notification permission and whether the lists screen's banner
/// was closed. Dispatched at startup and when the account sheet opens, since
/// the user may have changed the permission in the browser or system settings.
class PushActionLoad extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final repo = GetIt.I.get<PushRepo>();
    final permission = await repo.permission();
    final dismissed = await repo.bannerDismissed();
    return state.copyWith(
      pushPermission: permission,
      pushBannerDismissed: dismissed,
    );
  }
}
