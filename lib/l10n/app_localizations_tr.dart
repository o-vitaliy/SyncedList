// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Alışveriş listen boş.';

  @override
  String invitedInToLists(String name) {
    return '$name listesi eklendi';
  }

  @override
  String loginToAddList(String name) {
    return '$name seninle paylaşıldı. Görmek için giriş yap.';
  }

  @override
  String get emptyListInfo1 => 'Henüz hiç alışveriş listen yok.';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get deleteItemConfirm => 'Bu ürünü silmek istediğinden emin misin?';

  @override
  String get deleteListConfirm => 'Bu listeyi silmek istediğinden emin misin?';

  @override
  String get delete => 'Sil';

  @override
  String get share => 'Paylaş';

  @override
  String get yourLists => 'Listelerin';

  @override
  String get newItemName => 'Yeni ürün';

  @override
  String get newListName => 'Yeni liste adı';

  @override
  String get ok => 'Tamam';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get passwordMatch => 'Şifreler eşleşmiyor';

  @override
  String get invalidEmailFormat => 'Geçersiz e-posta';

  @override
  String get requiredField => 'Bu alan zorunludur';

  @override
  String get sortOneTime => 'Bir kez sırala';

  @override
  String get sortAuto => 'Otomatik sırala';

  @override
  String get sortNameDone => 'Ada ve işaretlenene göre';

  @override
  String get sortDone => 'İşaretlenene göre';

  @override
  String get sortName => 'Ada göre';

  @override
  String get loginExecuteFacebook => 'Facebook ile devam et';

  @override
  String get loginExecuteGoogle => 'Google ile devam et';

  @override
  String get appTagline =>
      'Birlikte paylaşıp işaretlediğiniz alışveriş listeleri, gerçek zamanlı.';

  @override
  String get loginAnonymous => 'Hesap olmadan devam et';

  @override
  String get getAndroidApp => 'Android uygulamasını indir';

  @override
  String get termsOfUse => 'Kullanım koşulları';

  @override
  String get privacyPolicy => 'Gizlilik politikası';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get newList => 'Yeni liste';

  @override
  String get addItem => 'Ürün ekle';

  @override
  String get editItem => 'Ürünü düzenle';

  @override
  String get renameList => 'Listeyi yeniden adlandır';

  @override
  String get sharedList => 'Paylaşılan';

  @override
  String get sortMenu => 'Sırala';

  @override
  String itemsProgress(int done, int total) {
    return '$total üründen $done tanesi alındı';
  }

  @override
  String get emptyListsBody =>
      'Bir liste oluştur, sonra birlikte alışveriş yapmak için paylaş.';

  @override
  String get emptyItemsBody =>
      'İlk ürünü ekle ya da başkaları da ekleyebilsin diye listeyi paylaş.';

  @override
  String get account => 'Hesap';

  @override
  String get guest => 'Misafir';

  @override
  String get guestInfo =>
      'SyncedList\'i hesap olmadan kullanıyorsun. Listelerini korumak ve diğer cihazlarında kullanmak için giriş yap.';

  @override
  String get signedInWith => 'Giriş yapıldı';

  @override
  String get signOut => 'Çıkış yap';

  @override
  String get signOutConfirm => 'SyncedList\'ten çıkış yapılsın mı?';

  @override
  String get accountLinked => 'Giriş yapıldı. Listelerin hesabına kaydedildi.';

  @override
  String get accountSwitched =>
      'Mevcut hesabına giriş yapıldı. Listelerin bu hesaba eklendi.';

  @override
  String get openList => 'Aç';

  @override
  String get notificationsTitle => 'Bildirimler';

  @override
  String get notificationsInfo =>
      'Ortak listelerinize başkaları ürün eklediğinde veya işaretlediğinde bildirim alın.';

  @override
  String get notificationsTurnOn => 'Bildirimleri aç';

  @override
  String get notificationsTurnOnShort => 'Aç';

  @override
  String get notNow => 'Şimdi değil';

  @override
  String get notificationsOn => 'Bildirimler açık';

  @override
  String get notificationsBlockedWeb =>
      'Bildirimler engellendi. Tarayıcı ayarlarından bu siteye izin verin.';

  @override
  String get notificationsBlockedApp =>
      'Bildirimler kapalı. Cihaz ayarlarından SyncedList için açın.';

  @override
  String get notificationsIosHomeScreen =>
      'iPhone’da bildirim almak için SyncedList’i Ana Ekran’a ekleyin: Paylaş’a, ardından Ana Ekrana Ekle’ye dokunun.';
}
