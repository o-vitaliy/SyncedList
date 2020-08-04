import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/app/action_report.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/validators/email_validator.dart';
import 'package:shared_shopping_list/data/validators/empty_validator.dart';
import 'package:shared_shopping_list/l.dart';
import 'package:shared_shopping_list/widgets/widgets.dart';

import 'register_action.dart';

class RegisterView extends StatelessWidget {
  RegisterView();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.of(context).register.title),
      ),
      body: StoreConnector<AppState, _ViewModel>(
          model: _ViewModel(),
          onInit: (store) => store.dispatch(RegisterInitAction()),
          builder: _content),
    );
  }

  Widget _content(final BuildContext context, _ViewModel vm) {
    return Stack(children: [
      SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  validator: (value) => _emailValidation(context, value),
                  onChanged: vm.emailChange,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      InputDecoration(hintText: L.of(context).hint.email),
                ),
                defaultSpacer(),
                TextFormField(
                  obscureText: true,
                  controller: _pass,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: vm.passwordChange,
                  validator: (value) => _passwordValidation(context, value),
                  decoration:
                      InputDecoration(hintText: L.of(context).hint.password),
                ),
                defaultSpacer(),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: vm.passwordConfirmChange,
                  validator: (value) =>
                      _passwordConfirmValidation(context, value, _pass.text),
                  decoration: InputDecoration(
                      hintText: L.of(context).hint.passwordConfirm),
                ),
                defaultSpacer(),
                defaultSpacer(),
                RaisedButton(
                  onPressed: () => doRegister(context, vm),
                  child: Text(L.of(context).register.execute),
                ),
              ],
            ),
          ),
        ),
      ),
      if (vm.loading) LoadingIndicator()
    ]);
  }

  void doRegister(BuildContext context, _ViewModel vm) {
    if (!_form.currentState.validate()) return;
    var completer = Completer<ActionReport>();
    completer.future.then((value) {
      if (value.status == RequestStatus.complete) {
        succeed(context);
      } else if (value.status == RequestStatus.error) {
        showSnack(context, value.msg);
      }
    });
    vm.execute(completer);
  }

  void openSingUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/registration");
  }

  void succeed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/main");
  }

  String _emailValidation(BuildContext context, String value) {
    value = value.trim();
    final error = EmptyValidator().valid(value, "requiredField") ??
        EmailValidator().valid(value, "invalidEmailFormat");
    if (error != null) {
      return LDelegate.get(context, error);
    }
    return null;
  }

  String _passwordValidation(BuildContext context, String value) {
    final error = EmptyValidator().valid(value, "requiredField");
    if (error != null) {
      return LDelegate.get(context, error);
    }
    return null;
  }

  String _passwordConfirmValidation(
    BuildContext context,
    String value,
    String originalPassword,
  ) {
    final error = value != originalPassword ? "passwordMatch" : null;
    if (error != null) {
      return LDelegate.get(context, error);
    }
    return null;
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  bool loading;
  ValueChanged<String> emailChange;
  ValueChanged<String> passwordChange;
  ValueChanged<String> passwordConfirmChange;
  Function(Completer) execute;

  _ViewModel.build({
    @required this.loading,
    @required this.emailChange,
    @required this.passwordChange,
    @required this.passwordConfirmChange,
    @required this.execute,
  }) : super(equals: [loading]);

  @override
  _ViewModel fromStore() {
    final emailChange = (v) => dispatch(RegisterEmailChangedAction(value: v));
    final passwordChange =
        (v) => dispatch(RegisterPasswordChangedAction(value: v));
    final passwordConfirmChange = (v) {
      dispatch(RegisterPasswordConfirmChangedAction(value: v));
    };

    final execute = (c) => dispatch(RegisterExecuteAction(completer: c));
    return _ViewModel.build(
      loading: state.registerState.isLoading,
      emailChange: emailChange,
      passwordChange: passwordChange,
      passwordConfirmChange: passwordConfirmChange,
      execute: execute,
    );
  }
}
