import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/deeplinks/deeplink.dart';
import 'package:shopping_list/localization.dart';

void main() {
  test('share link round-trips list id and name', () {
    final link = Deeplink.createLink('abc123', 'Groceries & more');

    expect(Deeplink.isListLink(link), isTrue);
    expect(link.queryParameters[idKey], 'abc123');
    expect(link.queryParameters[nameKey], 'Groceries & more');
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('loads ${locale.languageCode} translations', (tester) async {
      late AppLocalizations l;
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        localizationsDelegates: appLocalizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(builder: (context) {
          l = AppLocalizations.of(context);
          return const SizedBox();
        }),
      ));

      expect(l.invitedInToLists('Milk'), contains('Milk'));
      expect(l.loginToAddList('Milk'), contains('Milk'));
      expect(l.sortAuto, isNotEmpty);
    });
  }
}
