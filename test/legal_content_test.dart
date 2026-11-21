import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/ui/legal/legal_content.dart';

void main() {
  for (final type in LegalDocType.values) {
    test('$type has matching English and Russian structure', () {
      final en = legalDoc(type, 'en');
      final ru = legalDoc(type, 'ru');
      expect(ru.title, isNot(en.title));
      expect(ru.sections.length, en.sections.length);
      for (var i = 0; i < en.sections.length; i++) {
        final e = en.sections[i], r = ru.sections[i];
        expect(r.paragraphs.length, e.paragraphs.length, reason: 'section $i');
        expect(r.bullets.length, e.bullets.length, reason: 'section $i');
        expect(
          r.links.map((l) => l.url),
          e.links.map((l) => l.url),
          reason: 'section $i',
        );
      }
    });
  }

  test('unknown languages fall back to English', () {
    expect(legalDoc(LegalDocType.terms, 'de').title, 'Terms of Use');
  });
}
