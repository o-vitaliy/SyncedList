import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/data/entities/account.dart';
import 'package:shopping_list/state/app_state.dart';

/// Dispatched for every Firebase auth user change (see `main`).
class AccountActionChanged extends ReduxAction<AppState> {
  final Account? account;

  AccountActionChanged(this.account);

  @override
  AppState reduce() =>
      state.copyWith(loginState: state.loginState.withAccount(account));
}
