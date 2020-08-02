import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/network/api_exception.dart';

class ActionReport {
  String actionName;
  RequestStatus status;
  String msg;

  ActionReport({
    this.actionName,
    this.status,
    this.msg,
  });

  ActionReport copyWith({
    String actionName,
    RequestStatus status,
    String msg,
  }) {
    return ActionReport(
      actionName: actionName ?? this.actionName,
      status: status ?? this.status,
      msg: msg ?? this.msg,
    );
  }
}

enum RequestStatus { running, complete, complete_no_more, error }

abstract class Action extends ReduxAction<AppState> {
  final String actionName;
  final Completer<ActionReport> completer;

  Action(this.completer, this.actionName);
}

void _catchError(Action action, String error) {
  if (action.completer != null) {
    action.completer.complete(ActionReport(
        actionName: action.actionName,
        status: RequestStatus.error,
        msg: error.toString()));
  }
}

void catchException(Action action, Exception e) {
  if (e is ApiException) {
    _catchError(action, e.cause);
  } else {
    _catchError(action, _exceptionMessage(e) ?? e.toString());
  }
}

String _exceptionMessage(e) {
  try {
    return e.message;
  } catch (_) {
    return null;
  }
}

void completed(Action action) {
  if (action.completer != null) {
    action.completer.complete(ActionReport(
        actionName: action.actionName,
        status: RequestStatus .complete,
        msg: "${action.actionName} is completed"));
  }
}

void noMoreItem(Action action) {
  if (action.completer != null) {
    action.completer.complete(ActionReport(
        actionName: action.actionName,
        status: RequestStatus.complete,
        msg: "no more items"));
  }
}
