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

/// Asks before a destructive action; [action] runs only on confirm.
void confirmDialog(
  BuildContext context,
  String title,
  VoidCallback action, {
  IconData icon = Icons.delete_outline,
}) {
  final l = AppLocalizations.of(context);
  final scheme = Theme.of(context).colorScheme;
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      icon: Icon(icon, color: scheme.error),
      title: Text(title, textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text(l.cancel),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: scheme.error,
            foregroundColor: scheme.onError,
            minimumSize: const Size(64, 40),
          ),
          onPressed: () {
            action();
            Navigator.of(dialogContext).pop();
          },
          child: Text(l.delete),
        ),
      ],
    ),
  );
}
