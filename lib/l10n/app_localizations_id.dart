// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get emptyItemsListInfo1 => 'Daftar belanja Anda kosong.';

  @override
  String invitedInToLists(String name) {
    return 'Daftar $name telah ditambahkan';
  }

  @override
  String loginToAddList(String name) {
    return '$name telah dibagikan dengan Anda. Masuk untuk melihatnya.';
  }

  @override
  String get emptyListInfo1 => 'Anda belum punya daftar belanja.';

  @override
  String get rename => 'Ganti nama';

  @override
  String get deleteItemConfirm => 'Yakin ingin menghapus barang ini?';

  @override
  String get deleteListConfirm => 'Yakin ingin menghapus daftar ini?';

  @override
  String get delete => 'Hapus';

  @override
  String get share => 'Bagikan';

  @override
  String get yourLists => 'Daftar Anda';

  @override
  String get newItemName => 'Barang baru';

  @override
  String get newListName => 'Nama daftar baru';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get passwordMatch => 'Kata sandi tidak cocok';

  @override
  String get invalidEmailFormat => 'Email tidak valid';

  @override
  String get requiredField => 'Kolom ini wajib diisi';

  @override
  String get sortOneTime => 'Urutkan sekali';

  @override
  String get sortAuto => 'Urutkan otomatis';

  @override
  String get sortNameDone => 'Menurut nama & selesai';

  @override
  String get sortDone => 'Menurut selesai';

  @override
  String get sortName => 'Menurut nama';

  @override
  String get loginExecuteFacebook => 'Lanjutkan dengan Facebook';

  @override
  String get loginExecuteGoogle => 'Lanjutkan dengan Google';

  @override
  String get appTagline =>
      'Daftar belanja yang Anda bagikan dan centang bersama, secara real time.';

  @override
  String get loginAnonymous => 'Lanjutkan tanpa akun';

  @override
  String get getAndroidApp => 'Dapatkan aplikasi Android';

  @override
  String get termsOfUse => 'Ketentuan penggunaan';

  @override
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get newList => 'Daftar baru';

  @override
  String get addItem => 'Tambah barang';

  @override
  String get editItem => 'Edit barang';

  @override
  String get renameList => 'Ganti nama daftar';

  @override
  String get sharedList => 'Dibagikan';

  @override
  String get sortMenu => 'Urutkan';

  @override
  String itemsProgress(int done, int total) {
    return '$done dari $total selesai';
  }

  @override
  String get emptyListsBody =>
      'Buat daftar, lalu bagikan untuk belanja bersama.';

  @override
  String get emptyItemsBody =>
      'Tambahkan barang pertama, atau bagikan daftar agar orang lain bisa menambahkan barang mereka.';

  @override
  String get account => 'Akun';

  @override
  String get guest => 'Tamu';

  @override
  String get guestInfo =>
      'Anda menggunakan SyncedList tanpa akun. Masuk untuk menyimpan daftar Anda dan memakainya di perangkat lain.';

  @override
  String get signedInWith => 'Sudah masuk';

  @override
  String get signOut => 'Keluar';

  @override
  String get signOutConfirm => 'Keluar dari SyncedList?';

  @override
  String get accountLinked =>
      'Sudah masuk. Daftar Anda tersimpan di akun Anda.';

  @override
  String get accountSwitched =>
      'Masuk ke akun Anda yang sudah ada. Daftar Anda telah ditambahkan ke akun itu.';

  @override
  String get openList => 'Buka';
}
