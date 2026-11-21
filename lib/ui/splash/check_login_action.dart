import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/ui/push/actions/push_action_open_list.dart';
import 'package:shopping_list/ui/list/new_list/actions/new_list_action_add_from_invites.dart';

import '/app.dart';
import '/state/app_state.dart';

class CheckLoginAction extends ReduxAction<AppState> {
  /// The splash screen's route, which the start screen replaces.
  final Route<dynamic> splashRoute;

  CheckLoginAction(this.splashRoute);

  @override
  Future<AppState?> reduce() async {
    final authDataSource = GetIt.I.get<AuthRepo>();
    final authorized = await authDataSource.isAuthorized();

    final loginState = state.loginState.copy(authorized: authorized);

    return state.copyWith(loginState: loginState);
  }

  @override
  void after() {
    final authorized = state.loginState.authorized == true;
    if (authorized) dispatch(NewListActionAddFromInvite());
    final target = authorized ? "/main" : "/login";

    // A tapped push that launched the app opens its list over the lists screen.
    final push = GetIt.I.get<PushRepo>();
    final pushListId = authorized ? push.pendingListId : null;
    push.pendingListId = null;

    if (splashRoute.isCurrent) {
      dispatch(NavigateAction.pushReplacementNamed(target));
      if (pushListId != null) dispatch(PushActionOpenList(pushListId));
      return;
    }
    // The app was opened on a page above the splash screen (on the web, a URL
    // like /#/terms or /#/privacy). Keep that page and put the start screen
    // under it, so back leads there.
    navigatorKey.currentState?.replace(
      oldRoute: splashRoute,
      newRoute: MaterialPageRoute(
        settings: RouteSettings(name: target),
        builder: routes[target]!,
      ),
    );
  }
}
