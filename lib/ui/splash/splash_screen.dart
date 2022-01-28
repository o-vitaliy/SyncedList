import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:give_a_ride/state/app_state.dart';
import 'package:give_a_ride/ui/widgets/widgets.dart';

import 'check_login_action.dart';

class SplashConnector extends StatelessWidget {
  const SplashConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _Factory(this),
      onInit: (store) => store.dispatch(CheckLoginAction()),
      builder: (BuildContext context, _ViewModel vm) => _SplashPage(),
    );
  }
}

class _Factory extends VmFactory<AppState, SplashConnector> {
  _Factory(widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        authorized: state.loginState.authorized,
      );
}

class _ViewModel extends Vm {
  final bool? authorized;

  _ViewModel({
    required this.authorized,
  }) : super(equals: [authorized]);
}

class _SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadingIndicator());
  }
}
