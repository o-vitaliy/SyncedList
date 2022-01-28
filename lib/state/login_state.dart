import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

@immutable
class LoginState {
  final bool? authorized;

  const LoginState({
    required this.authorized,
  });

  LoginState copy({bool? authorized, Wait? waitLogin}) => LoginState(
        authorized: authorized ?? this.authorized,
      );

  static LoginState initialState() => LoginState(
        authorized: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          authorized == other.authorized;

  @override
  int get hashCode => authorized.hashCode;
}
