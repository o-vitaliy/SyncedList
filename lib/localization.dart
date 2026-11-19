import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show GlobalMaterialLocalizations;

import 'l10n/app_localizations.dart';

export 'l10n/app_localizations.dart';

/// Use this instead of [AppLocalizations.localizationsDelegates]: the generated
/// list pulls Material/Cupertino delegates from flutter_localizations, which
/// MaterialApp from material_ui doesn't recognize.
const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates = [
  AppLocalizations.delegate,
  ...GlobalMaterialLocalizations.delegates,
];

/// Looks up a translated validator message by its key, falling back to the key.
String localizedValidatorMessage(BuildContext c, String key) {
  final l = AppLocalizations.of(c);
  return {
        "requiredField": l.requiredField,
        "invalidEmailFormat": l.invalidEmailFormat,
        "passwordMatch": l.passwordMatch,
      }[key] ??
      key;
}
