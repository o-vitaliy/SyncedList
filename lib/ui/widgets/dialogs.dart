import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/localization.dart';

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
            child: Text(Localizations.of(context, AppLocalizationsData).ok),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(userException.dialogTitle()),
        content: Text(userException.dialogContent()),
        actions: [
          TextButton(
            child: Text(Localizations.of(context, AppLocalizationsData).ok),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}

void confirmDialog(BuildContext context, String title, VoidCallback action) {
  final l = Localizations.of(context, AppLocalizationsData);
  final t = Theme.of(context);
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(title),
            actions: [
              ElevatedButton(
                  child: Text(l.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              ElevatedButton(
                  child: Text(l.ok),
                  style: t.elevatedButtonTheme.style,
                  onPressed: () {
                    action();
                    Navigator.of(context).pop();
                  })
            ],
          ));
}
