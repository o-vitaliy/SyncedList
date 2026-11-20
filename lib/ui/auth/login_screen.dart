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
    return Scaffold(
      body: StoreConnector<AppState, _ViewModel>(
        vm: () => _Factory(this),
        onInitialBuild: (_, s, vm) => _showInvite(context, vm),
        onDidChange: (_, s, vm) => _showInvite(context, vm),
        builder: (BuildContext context, _ViewModel vm) => _Page(
          loginAsAnonymous: vm.loginAsAnonymous,
          loginViaGoogle: vm.loginViaGoogle,
          loginViaFacebook: vm.loginViaFacebook,
          loggingIn: vm.loggingIn,
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
    loggingIn: isWaiting([
      LoginAsAnonymousAction,
      LoginViaGoogle,
      LoginViaFacebook,
    ]),
  );
}

class _ViewModel extends Vm {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;
  final Event<String> loginToViewList;
  final bool loggingIn;

  _ViewModel({
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
    required this.loginToViewList,
    required this.loggingIn,
  }) : super(equals: [loginToViewList, loggingIn]);
}

class _Page extends StatelessWidget {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;
  final bool loggingIn;

  const _Page({
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
    required this.loggingIn,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final enabled = !loggingIn;

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: AppMark()),
                const SizedBox(height: 28),
                Text(
                  "SyncedList",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l.appTagline,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 48),
                FilledButton.icon(
                  onPressed: enabled ? loginViaGoogle : null,
                  icon: const Icon(Icons.account_circle_outlined),
                  label: Text(l.loginExecuteGoogle),
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: enabled ? loginViaFacebook : null,
                  icon: const Icon(Icons.facebook),
                  label: Text(l.loginExecuteFacebook),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: enabled ? loginAsAnonymous : null,
                  child: Text(l.loginAnonymous),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 4,
                  child: loggingIn ? const LinearProgressIndicator() : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
