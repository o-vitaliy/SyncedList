// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'आपकी शॉपिंग लिस्ट खाली है।';

  @override
  String invitedInToLists(String name) {
    return '$name लिस्ट जोड़ दी गई है';
  }

  @override
  String loginToAddList(String name) {
    return '$name आपके साथ शेयर की गई है। देखने के लिए लॉग इन करें।';
  }

  @override
  String get emptyListInfo1 => 'आपके पास अभी कोई शॉपिंग लिस्ट नहीं है।';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get deleteItemConfirm => 'क्या आप वाकई यह आइटम हटाना चाहते हैं?';

  @override
  String get deleteListConfirm => 'क्या आप वाकई यह लिस्ट हटाना चाहते हैं?';

  @override
  String get delete => 'हटाएं';

  @override
  String get share => 'शेयर करें';

  @override
  String get yourLists => 'आपकी लिस्ट';

  @override
  String get newItemName => 'नया आइटम';

  @override
  String get newListName => 'नई लिस्ट का नाम';

  @override
  String get ok => 'ठीक है';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सेव करें';

  @override
  String get passwordMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get invalidEmailFormat => 'अमान्य ईमेल';

  @override
  String get requiredField => 'यह फ़ील्ड ज़रूरी है';

  @override
  String get sortOneTime => 'एक बार क्रमित करें';

  @override
  String get sortAuto => 'अपने-आप क्रमित करें';

  @override
  String get sortNameDone => 'नाम और पूरे के अनुसार';

  @override
  String get sortDone => 'पूरे के अनुसार';

  @override
  String get sortName => 'नाम के अनुसार';

  @override
  String get loginExecuteFacebook => 'Facebook से जारी रखें';

  @override
  String get loginExecuteGoogle => 'Google से जारी रखें';

  @override
  String get appTagline =>
      'शॉपिंग लिस्ट जिन्हें आप मिलकर शेयर करें और टिक करें, रियल टाइम में।';

  @override
  String get loginAnonymous => 'बिना अकाउंट के जारी रखें';

  @override
  String get getAndroidApp => 'Android ऐप पाएं';

  @override
  String get termsOfUse => 'उपयोग की शर्तें';

  @override
  String get privacyPolicy => 'निजता नीति';

  @override
  String get themeTitle => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get newList => 'नई लिस्ट';

  @override
  String get addItem => 'आइटम जोड़ें';

  @override
  String get editItem => 'आइटम बदलें';

  @override
  String get renameList => 'लिस्ट का नाम बदलें';

  @override
  String get sharedList => 'शेयर की गई';

  @override
  String get sortMenu => 'क्रमित करें';

  @override
  String itemsProgress(int done, int total) {
    return '$total में से $done पूरे';
  }

  @override
  String get emptyListsBody =>
      'एक लिस्ट बनाएं, फिर साथ में खरीदारी के लिए उसे शेयर करें।';

  @override
  String get emptyItemsBody =>
      'पहला आइटम जोड़ें, या लिस्ट शेयर करें ताकि दूसरे भी अपने आइटम जोड़ सकें।';

  @override
  String get account => 'अकाउंट';

  @override
  String get guest => 'मेहमान';

  @override
  String get guestInfo =>
      'आप बिना अकाउंट के SyncedList इस्तेमाल कर रहे हैं। अपनी लिस्ट बचाने और दूसरे डिवाइस पर इस्तेमाल करने के लिए साइन इन करें।';

  @override
  String get signedInWith => 'साइन इन है';

  @override
  String get signOut => 'साइन आउट करें';

  @override
  String get signOutConfirm => 'SyncedList से साइन आउट करें?';

  @override
  String get accountLinked =>
      'साइन इन हो गया। आपकी लिस्ट आपके अकाउंट में सेव हैं।';

  @override
  String get accountSwitched =>
      'आपके मौजूदा अकाउंट में साइन इन हो गया। आपकी लिस्ट उसमें जोड़ दी गई हैं।';

  @override
  String get openList => 'खोलें';
}
