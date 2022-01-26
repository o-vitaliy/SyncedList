import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final bool? authorized;

  const AppState({
    required this.authorized,
  });

  /// The copy method has a named [wait] parameter of type [Wait].
  AppState copy({bool? authorized}) => AppState(
        authorized: authorized ?? this.authorized,
      );

  /// The [wait] parameter is instantiated to `Wait()`.
  static AppState initialState() => AppState(
        authorized: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authorized == other.authorized;

  @override
  int get hashCode => authorized.hashCode;
}
