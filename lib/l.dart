import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'l.g.dart';

//https://docs.google.com/spreadsheets/d/1hK03GX7x26qnFuMyKga8Bd_yVhByGk9Bl1VXrD7Kdxo/edit?usp=sharing
@SheetLocalization("1hK03GX7x26qnFuMyKga8Bd_yVhByGk9Bl1VXrD7Kdxo", "0", 12)
class LDelegate extends LocalizationsDelegate<L> {
  const LDelegate();

  @override
  bool isSupported(Locale locale) => L.languages.containsKey(locale);

  @override
  Future<L> load(Locale locale) => SynchronousFuture<L>(L(locale));

  @override
  bool shouldReload(LDelegate old) => false;

  static String get(BuildContext context, key) {
    final l = L.of(context);
    return {
          "requiredField": l.requiredField,
          "invalidEmailFormat": l.invalidEmailFormat,
          "passwordMatch": l.passwordMatch,
        }[key] ??
        key;
  }
}
