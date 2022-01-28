import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

import 'login_state.dart';

@immutable
class AppState {
  final LoginState loginState;

  final Wait wait;

  const AppState({
    required this.loginState,
    required this.wait,
  });

  /// The copy method has a named [wait] parameter of type [Wait].
  AppState copy({LoginState? loginState, Wait? wait}) => AppState(
        loginState: loginState ?? this.loginState,
        wait: wait ?? this.wait,
      );

  /// The [wait] parameter is instantiated to `Wait()`.
  static AppState initialState() => AppState(
        loginState: LoginState.initialState(),
        wait: Wait(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          wait == other.wait;

  @override
  int get hashCode => loginState.hashCode ^ wait.hashCode;
}
