import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// No description provided for @emptyItemsListInfo1.
  ///
  /// In en, this message translates to:
  /// **'Your shopping list is empty.'**
  String get emptyItemsListInfo1;

  /// No description provided for @invitedInToLists.
  ///
  /// In en, this message translates to:
  /// **'{name} list has been added'**
  String invitedInToLists(String name);

  /// No description provided for @loginToAddList.
  ///
  /// In en, this message translates to:
  /// **'{name} has been shared with you. Login to view it.'**
  String loginToAddList(String name);

  /// No description provided for @emptyListInfo1.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any shopping list yet.'**
  String get emptyListInfo1;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @deleteItemConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are sure you want to delete this item?'**
  String get deleteItemConfirm;

  /// No description provided for @deleteListConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are sure you want to delete this list?'**
  String get deleteListConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'To share'**
  String get share;

  /// No description provided for @yourLists.
  ///
  /// In en, this message translates to:
  /// **'Your lists'**
  String get yourLists;

  /// No description provided for @newItemName.
  ///
  /// In en, this message translates to:
  /// **'New item'**
  String get newItemName;

  /// No description provided for @newListName.
  ///
  /// In en, this message translates to:
  /// **'New list name'**
  String get newListName;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @passwordMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordMatch;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmailFormat;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @sortOneTime.
  ///
  /// In en, this message translates to:
  /// **'One time sort'**
  String get sortOneTime;

  /// No description provided for @sortAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto sort'**
  String get sortAuto;

  /// No description provided for @sortNameDone.
  ///
  /// In en, this message translates to:
  /// **'By name & done'**
  String get sortNameDone;

  /// No description provided for @sortDone.
  ///
  /// In en, this message translates to:
  /// **'By done'**
  String get sortDone;

  /// No description provided for @sortName.
  ///
  /// In en, this message translates to:
  /// **'By name'**
  String get sortName;

  /// No description provided for @loginExecuteFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get loginExecuteFacebook;

  /// No description provided for @loginExecuteGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginExecuteGoogle;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Shopping lists you share and check off together, in real time.'**
  String get appTagline;

  /// No description provided for @loginAnonymous.
  ///
  /// In en, this message translates to:
  /// **'Continue without an account'**
  String get loginAnonymous;

  /// No description provided for @getAndroidApp.
  ///
  /// In en, this message translates to:
  /// **'Get the Android app'**
  String get getAndroidApp;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @newList.
  ///
  /// In en, this message translates to:
  /// **'New list'**
  String get newList;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get editItem;

  /// No description provided for @renameList.
  ///
  /// In en, this message translates to:
  /// **'Rename list'**
  String get renameList;

  /// No description provided for @sharedList.
  ///
  /// In en, this message translates to:
  /// **'Shared'**
  String get sharedList;

  /// No description provided for @sortMenu.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sortMenu;

  /// No description provided for @itemsProgress.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} done'**
  String itemsProgress(int done, int total);

  /// No description provided for @emptyListsBody.
  ///
  /// In en, this message translates to:
  /// **'Create a list, then share it to shop together.'**
  String get emptyListsBody;

  /// No description provided for @emptyItemsBody.
  ///
  /// In en, this message translates to:
  /// **'Add the first item, or share the list so others can add theirs.'**
  String get emptyItemsBody;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @guestInfo.
  ///
  /// In en, this message translates to:
  /// **'You\'re using SyncedList without an account. Sign in to keep your lists and use them on your other devices.'**
  String get guestInfo;

  /// No description provided for @signedInWith.
  ///
  /// In en, this message translates to:
  /// **'Signed in'**
  String get signedInWith;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign out of SyncedList?'**
  String get signOutConfirm;

  /// No description provided for @accountLinked.
  ///
  /// In en, this message translates to:
  /// **'Signed in. Your lists are saved to your account.'**
  String get accountLinked;

  /// No description provided for @accountSwitched.
  ///
  /// In en, this message translates to:
  /// **'Signed in to your existing account. Your lists were added to it.'**
  String get accountSwitched;

  /// No description provided for @openList.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openList;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
