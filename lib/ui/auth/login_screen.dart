import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/ui/auth/actions/login_via_facebook.dart';
import 'package:shopping_list/ui/auth/actions/login_via_google.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import '../../state/app_state.dart';
import 'actions/login_as_anonymous.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: UserExceptionDialog<AppState>(
        child: StoreConnector<AppState, _ViewModel>(
          vm: () => _Factory(this),
          builder: (BuildContext context, _ViewModel vm) => _Page(
            loginAsAnonymous: vm.loginAsAnonymous,
            loginViaGoogle: vm.loginViaGoogle,
            loginViaFacebook: vm.loginViaFacebook,
          ),
        ),
      ),
    );
  }
}

class _Factory extends VmFactory<AppState, LoginScreen> {
  _Factory(widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        loginAsAnonymous: () => dispatch(LoginAsAnonymousAction()),
        loginViaGoogle: () => dispatch(LoginViaGoogle()),
        loginViaFacebook: () => dispatch(LoginViaFacebook()),
      );
}

class _ViewModel extends Vm {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;

  _ViewModel({
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
  }) : super(equals: []);
}

class _Page extends StatelessWidget {
  final VoidCallback loginAsAnonymous;
  final VoidCallback loginViaGoogle;
  final VoidCallback loginViaFacebook;

  const _Page({
    Key? key,
    required this.loginAsAnonymous,
    required this.loginViaGoogle,
    required this.loginViaFacebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LabelButton(
            onPressed: loginAsAnonymous,
            text: "Login as Anonymous",
          ),
          LabelButton(
            onPressed: loginViaGoogle,
            text: "Login with Google",
          ),
          LabelButton(
            onPressed: loginViaFacebook,
            text: "Login with Facebook",
          )
        ],
      ),
    );
  }
}
