import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// Registers this install with FCM on every app start, if notifications are
/// allowed, without ever asking. FCM can drop a registration (a browser
/// clearing its push subscription, an app update, a long time offline), and
/// registering again brings the device back, saved under the signed-in user
/// through `onRegistered`.
class PushActionRegister extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final permission = await GetIt.I.get<PushRepo>().enable(ask: false);
    return state.copyWith(pushPermission: permission);
  }
}
