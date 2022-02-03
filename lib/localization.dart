import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localization.g.dart';

//https://docs.google.com/spreadsheets/d/1hK03GX7x26qnFuMyKga8Bd_yVhByGk9Bl1VXrD7Kdxo/edit?usp=sharing
@SheetLocalization("1hK03GX7x26qnFuMyKga8Bd_yVhByGk9Bl1VXrD7Kdxo", "0", 12)
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizationsData> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => localizedLabels.containsKey(locale);

  @override
  Future<AppLocalizationsData> load(Locale locale) =>
      SynchronousFuture<AppLocalizationsData>(localizedLabels[locale]!);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  static String get(BuildContext c, key) {
    final l = Localizations.of(c, AppLocalizationsData);
    return {
          "requiredField": l.requiredField,
          "invalidEmailFormat": l.invalidEmailFormat,
          "passwordMatch": l.passwordMatch,
        }[key] ??
        key;
  }
}
