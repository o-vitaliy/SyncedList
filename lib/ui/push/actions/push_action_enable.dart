import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/state/app_state.dart';

/// Registers for pushes, asking for notification permission if needed.
///
/// Dispatched on its own when the user's lists include a shared one, so
/// people who never share aren't asked. On the web it then only registers if
/// permission was already given: Safari and Firefox ignore a prompt that
/// doesn't come from a tap, and Chrome quietens such prompts, so the web asks
/// from the "Turn on notifications" buttons instead ([fromTap]).
class PushActionEnable extends ReduxAction<AppState> {
  final bool fromTap;

  PushActionEnable({this.fromTap = false});

  @override
  Future<AppState?> reduce() async {
    final permission = await GetIt.I.get<PushRepo>().enable(
      ask: fromTap || !kIsWeb,
    );
    return state.copyWith(pushPermission: permission);
  }
}
