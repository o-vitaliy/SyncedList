import 'package:flutter/foundation.dart';
import 'package:shopping_list/data/entities/account.dart';

@immutable
class LoginState {
  final bool? authorized;

  /// The current Firebase user; null when signed out.
  final Account? account;

  const LoginState({required this.authorized, this.account});

  LoginState copy({bool? authorized}) =>
      LoginState(authorized: authorized ?? this.authorized, account: account);

  /// [copy] can't clear [account], so updates from the auth stream use this.
  LoginState withAccount(Account? account) =>
      LoginState(authorized: authorized, account: account);

  static LoginState initialState() => const LoginState(authorized: null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          authorized == other.authorized &&
          account == other.account;

  @override
  int get hashCode => Object.hash(authorized, account);
}
