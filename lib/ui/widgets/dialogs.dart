import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/localization.dart';

void defaultUserExceptionDialog(
  BuildContext context,
  UserException userException,
) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(userException.titleAndContent().$1),
        content: Text(userException.titleAndContent().$2),
        actions: [
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context).ok),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(userException.titleAndContent().$1),
        content: Text(userException.titleAndContent().$2),
        actions: [
          TextButton(
            child: Text(AppLocalizations.of(context).ok),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

void confirmDialog(BuildContext context, String title, VoidCallback action) {
  final l = AppLocalizations.of(context);
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
          },
        ),
        ElevatedButton(
          style: t.elevatedButtonTheme.style,
          onPressed: () {
            action();
            Navigator.of(context).pop();
          },
          child: Text(l.ok),
        ),
      ],
    ),
  );
}
