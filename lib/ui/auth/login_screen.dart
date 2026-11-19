import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/ui/auth/actions/login_via_facebook.dart';
import 'package:shopping_list/ui/auth/actions/login_via_google.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import '../../localization.dart';
import '../../state/app_state.dart';
import 'actions/login_as_anonymous.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.loginTitle)),
      body: StoreConnector<AppState, _ViewModel>(
        vm: () => _Factory(this),
        onInitialBuild: (_, s, vm) => _showInvite(context, vm),
        onDidChange: (_, s, vm) => _showInvite(context, vm),
        builder: (BuildContext context, _ViewModel vm) => _Page(
          loginAsAnonymous: vm.loginAsAnonymous,
          loginViaGoogle: vm.loginViaGoogle,
          loginViaFacebook: vm.loginViaFacebook,
        ),
      ),
    );
  }
}

void _showInvite(BuildContext context, _ViewModel vm) {
  final listName = vm.loginToViewList.consume();
  if (listName != null) {
    defaultToast(AppLocalizations.of(context).loginToAddList(listName));
  }
}

class _Factory extends VmFactory<AppState, LoginScreen, _ViewModel> {
  _Factory(LoginScreen super.widget);

  @override
  _ViewModel fromStore() => _ViewModel(
    loginAsAnonymous: () => dispatch(LoginAsAnonymousAction()),
    loginViaGoogle: () => dispatch(LoginViaGoogle()),
    loginViaFacebook: () => dispatch(LoginViaFacebook()),
    loginToViewList: state.loginToViewList,
  );
}

class _ViewModel extends Vm {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;
  final Event<String> loginToViewList;

  _ViewModel({
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
    required this.loginToViewList,
  }) : super(equals: [loginToViewList]);
}

class _Page extends StatelessWidget {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;

  const _Page({
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LabelButton(onPressed: loginAsAnonymous, text: "Login as Anonymous"),
          defaultSpacer8(),
          LabelButton(onPressed: loginViaGoogle, text: "Login with Google"),
          defaultSpacer8(),
          LabelButton(onPressed: loginViaFacebook, text: "Login with Facebook"),
        ],
      ),
    );
  }
}
