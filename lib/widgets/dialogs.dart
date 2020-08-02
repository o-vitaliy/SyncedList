import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../localizations.dart';

void defaultUserExceptionDialog(
  BuildContext context,
  UserException userException,
) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(userException.dialogTitle()),
        content: Text(userException.dialogContent()),
        actions: [
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  } else
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(userException.dialogTitle()),
        content: Text(userException.dialogContent()),
        actions: [
          FlatButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
}

void confirmDialog(BuildContext context, String title, VoidCallback action) {
  final l = L.of(context);
  final t = Theme.of(context);
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(title),
            actions: [
              RaisedButton(
                  child: Text(l.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              RaisedButton(
                  child: Text(l.ok),
                  color: t.primaryColor,
                  onPressed: () {
                    action();
                    Navigator.of(context).pop();
                  })
            ],
          ));
}
