// Text of the in-app Terms of Use and Privacy Policy screens, one file per
// language in docs/.
//
// The English documents are also published as web/terms.html and
// web/privacy.html (served at syncedlist.web.app/terms and /privacy for store
// listings and crawlers, which can't read a Flutter page). Keep both copies in
// sync, and keep every translation's sections in step with English.

part 'docs/legal_en.dart';
part 'docs/legal_uk.dart';
part 'docs/legal_ru.dart';
part 'docs/legal_pl.dart';
part 'docs/legal_de.dart';
part 'docs/legal_es.dart';
part 'docs/legal_pt.dart';
part 'docs/legal_fr.dart';
part 'docs/legal_it.dart';
part 'docs/legal_tr.dart';
part 'docs/legal_cs.dart';
part 'docs/legal_ja.dart';
part 'docs/legal_id.dart';
part 'docs/legal_hi.dart';

const _email = 'ovitaliy.rudenko@gmail.com';

class LegalLink {
  final String label;
  final String url;

  const LegalLink(this.label, this.url);
}

class LegalBullet {
  /// Bold lead-in, e.g. "Account details."
  final String? lead;
  final String text;

  const LegalBullet(this.lead, this.text);
}

class LegalSection {
  final String? heading;
  final List<String> paragraphs;
  final List<LegalBullet> bullets;
  final List<LegalLink> links;

  const LegalSection({
    this.heading,
    this.paragraphs = const [],
    this.bullets = const [],
    this.links = const [],
  });
}

class LegalDoc {
  final String title;
  final String effective;
  final List<LegalSection> sections;

  const LegalDoc({
    required this.title,
    required this.effective,
    required this.sections,
  });
}

enum LegalDocType { terms, privacy }

/// Terms and privacy policy for each language, by language code.
const _docs = <String, ({LegalDoc terms, LegalDoc privacy})>{
  'en': (terms: _termsEn, privacy: _privacyEn),
  'uk': (terms: _termsUk, privacy: _privacyUk),
  'ru': (terms: _termsRu, privacy: _privacyRu),
  'pl': (terms: _termsPl, privacy: _privacyPl),
  'de': (terms: _termsDe, privacy: _privacyDe),
  'es': (terms: _termsEs, privacy: _privacyEs),
  'pt': (terms: _termsPt, privacy: _privacyPt),
  'fr': (terms: _termsFr, privacy: _privacyFr),
  'it': (terms: _termsIt, privacy: _privacyIt),
  'tr': (terms: _termsTr, privacy: _privacyTr),
  'cs': (terms: _termsCs, privacy: _privacyCs),
  'ja': (terms: _termsJa, privacy: _privacyJa),
  'id': (terms: _termsId, privacy: _privacyId),
  'hi': (terms: _termsHi, privacy: _privacyHi),
};

/// Languages the legal documents are translated into.
Iterable<String> get legalLanguages => _docs.keys;

LegalDoc legalDoc(LegalDocType type, String languageCode) {
  final docs = _docs[languageCode] ?? _docs['en']!;
  return switch (type) {
    LegalDocType.terms => docs.terms,
    LegalDocType.privacy => docs.privacy,
  };
}

const _contact = LegalLink(_email, 'mailto:$_email');

const _firebasePrivacy = LegalLink(
  'Firebase',
  'https://firebase.google.com/support/privacy',
);
const _googlePrivacy = LegalLink(
  'Google',
  'https://policies.google.com/privacy',
);
const _facebookPrivacy = LegalLink(
  'Facebook',
  'https://www.facebook.com/privacy/policy/',
);
const _firebaseTerms = LegalLink(
  'Firebase',
  'https://firebase.google.com/terms',
);
const _googleTerms = LegalLink('Google', 'https://policies.google.com/terms');
const _facebookTerms = LegalLink(
  'Facebook',
  'https://www.facebook.com/legal/terms',
);
