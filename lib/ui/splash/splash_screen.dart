import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'check_login_action.dart';

class SplashConnector extends StatelessWidget {
  const SplashConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _Factory(this),
      onInitialBuild: (context, store, vm) =>
          store.dispatch(CheckLoginAction(ModalRoute.of(context!)!)),
      builder: (BuildContext context, _ViewModel vm) => _SplashPage(),
    );
  }
}

class _Factory extends VmFactory<AppState, SplashConnector, _ViewModel> {
  _Factory(SplashConnector super.widget);

  @override
  _ViewModel fromStore() => _ViewModel(authorized: state.loginState.authorized);
}

class _ViewModel extends Vm {
  final bool? authorized;

  _ViewModel({required this.authorized}) : super(equals: [authorized]);
}

class _SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppMark(),
            SizedBox(height: 32),
            SizedBox(width: 120, child: LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
