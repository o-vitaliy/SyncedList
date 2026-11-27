// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get emptyItemsListInfo1 => '買い物リストは空です。';

  @override
  String invitedInToLists(String name) {
    return 'リスト「$name」を追加しました';
  }

  @override
  String loginToAddList(String name) {
    return '「$name」が共有されました。表示するにはログインしてください。';
  }

  @override
  String get emptyListInfo1 => '買い物リストはまだありません。';

  @override
  String get rename => '名前を変更';

  @override
  String get deleteItemConfirm => 'このアイテムを削除しますか？';

  @override
  String get deleteListConfirm => 'このリストを削除しますか？';

  @override
  String get delete => '削除';

  @override
  String get share => '共有';

  @override
  String get yourLists => 'マイリスト';

  @override
  String get newItemName => '新しいアイテム';

  @override
  String get newListName => '新しいリストの名前';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get passwordMatch => 'パスワードが一致しません';

  @override
  String get invalidEmailFormat => 'メールアドレスが正しくありません';

  @override
  String get requiredField => 'この項目は必須です';

  @override
  String get sortOneTime => '今回だけ並べ替え';

  @override
  String get sortAuto => '自動で並べ替え';

  @override
  String get sortNameDone => '名前と購入済みの順';

  @override
  String get sortDone => '購入済みの順';

  @override
  String get sortName => '名前順';

  @override
  String get loginExecuteFacebook => 'Facebookで続ける';

  @override
  String get loginExecuteGoogle => 'Googleで続ける';

  @override
  String get appTagline => 'みんなで共有してチェックできる買い物リスト。リアルタイムで同期。';

  @override
  String get loginAnonymous => 'アカウントなしで続ける';

  @override
  String get getAndroidApp => 'Android版を入手';

  @override
  String get termsOfUse => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get themeTitle => 'テーマ';

  @override
  String get themeSystem => 'システム設定';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get newList => '新しいリスト';

  @override
  String get addItem => 'アイテムを追加';

  @override
  String get editItem => 'アイテムを編集';

  @override
  String get renameList => 'リスト名を変更';

  @override
  String get sharedList => '共有中';

  @override
  String get sortMenu => '並べ替え';

  @override
  String itemsProgress(int done, int total) {
    return '$total件中$done件購入済み';
  }

  @override
  String get emptyListsBody => 'リストを作成して共有すれば、一緒に買い物できます。';

  @override
  String get emptyItemsBody => '最初のアイテムを追加するか、リストを共有して他の人にも追加してもらいましょう。';

  @override
  String get account => 'アカウント';

  @override
  String get guest => 'ゲスト';

  @override
  String get guestInfo =>
      'アカウントなしでSyncedListを使用しています。ログインするとリストを保存して他のデバイスでも使えます。';

  @override
  String get signedInWith => 'ログイン済み';

  @override
  String get signOut => 'ログアウト';

  @override
  String get signOutConfirm => 'SyncedListからログアウトしますか？';

  @override
  String get accountLinked => 'ログインしました。リストはアカウントに保存されています。';

  @override
  String get accountSwitched => '既存のアカウントにログインしました。リストはそのアカウントに追加されました。';

  @override
  String get openList => '開く';

  @override
  String get notificationsTitle => '通知';

  @override
  String get notificationsInfo => '共有リストに他の人がアイテムを追加したりチェックしたりしたときに通知を受け取れます。';

  @override
  String get notificationsTurnOn => '通知をオンにする';

  @override
  String get notificationsTurnOnShort => 'オンにする';

  @override
  String get notNow => '今はしない';

  @override
  String get notificationsOn => '通知はオンです';

  @override
  String get notificationsBlockedWeb =>
      '通知がブロックされています。ブラウザの設定でこのサイトの通知を許可してください。';

  @override
  String get notificationsBlockedApp =>
      '通知はオフです。デバイスの設定で SyncedList の通知をオンにしてください。';

  @override
  String get notificationsIosHomeScreen =>
      'iPhone で通知を受け取るには、SyncedList をホーム画面に追加してください：共有をタップし、「ホーム画面に追加」を選びます。';
}
