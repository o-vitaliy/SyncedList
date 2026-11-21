import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/legal/legal_content.dart';

void main() {
  final translations = legalLanguages.where((l) => l != 'en');

  for (final type in LegalDocType.values) {
    for (final lang in translations) {
      test('$type has matching English and $lang structure', () {
        final en = legalDoc(type, 'en');
        final other = legalDoc(type, lang);
        expect(other.title, isNot(en.title));
        expect(other.sections.length, en.sections.length);
        for (var i = 0; i < en.sections.length; i++) {
          final e = en.sections[i], o = other.sections[i];
          expect(
            o.paragraphs.length,
            e.paragraphs.length,
            reason: 'section $i',
          );
          expect(o.bullets.length, e.bullets.length, reason: 'section $i');
          expect(
            o.links.map((l) => l.url),
            e.links.map((l) => l.url),
            reason: 'section $i',
          );
        }
      });
    }
  }

  test('every app language has its own legal documents', () {
    final appLanguages = AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toSet();
    expect(legalLanguages.toSet(), appLanguages);
    final intros = legalLanguages.map(
      (l) => legalDoc(LegalDocType.terms, l).sections.first.paragraphs.first,
    );
    expect(intros.toSet().length, legalLanguages.length);
  });

  test('unknown languages fall back to English', () {
    expect(legalDoc(LegalDocType.terms, 'zh').title, 'Terms of Use');
  });
}
