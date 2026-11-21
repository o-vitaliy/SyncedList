part of '../legal_content.dart';

const _privacyJa = LegalDoc(
  title: "プライバシーポリシー",
  effective: "2026年11月21日施行",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedListは、ovitaliyが提供する共有買い物リストの無料アプリで、Android、iOS、およびウェブ（syncedlist.web.app）で利用できます。本ポリシーでは、アプリが扱うデータ、その目的、共有先について説明します。SyncedListを利用することで、本ポリシーに同意したものとみなされます。",
      ],
    ),
    LegalSection(
      heading: "収集するデータ",
      bullets: [
        LegalBullet(
          "アカウント情報。",
          "GoogleまたはFacebookでログインした場合、そのサービスから氏名、メールアドレス、プロフィール写真を受け取ります。アカウントなしで利用する場合は、ランダムなIDを持ち個人情報を含まない匿名アカウントを作成します。",
        ),
        LegalBullet("リスト。", "リスト名とアイテム、その並び順とチェックの有無、および各リストのメンバーであるアカウント。"),
        LegalBullet(
          "クラッシュレポート。",
          "アプリがクラッシュしたりエラーが発生したりすると、デバイスの機種、OSのバージョン、アプリのバージョン、その時点のアプリの状態などを含むレポートが送信されます。",
        ),
        LegalBullet(
          "デバイス上の設定。",
          "テーマ、アイテムの並べ替え順、保留中のリスト招待は、お使いのデバイスにのみ保存されます。",
        ),
      ],
    ),
    LegalSection(
      heading: "データの利用方法",
      paragraphs: [
        "これらのデータは、アプリの運営にのみ使用します。具体的には、ログイン、リストの保存、お使いのデバイス間および共有相手との同期、不具合の発見と修正のためです。データの販売、広告の表示、マーケティングへの利用は行いません。",
      ],
    ),
    LegalSection(
      heading: "データを閲覧できる人",
      bullets: [
        LegalBullet(
          "リストを共有した相手。",
          "リストの共有リンクを開いた人は誰でもメンバーになり、リストを閲覧・編集できます。リンクは信頼できる人とだけ共有してください。",
        ),
        LegalBullet(
          "サービス提供者。",
          "SyncedListはGoogle Firebase上で動作しています：Firebase Authentication（ログイン）、Cloud Firestore（リストの保存）、Firebase Crashlytics（クラッシュレポート）、Firebase Hosting（ウェブサイト）。GoogleまたはFacebookでのログインも各社を経由します。各社はそれぞれのポリシーに従ってデータを処理します。",
        ),
        LegalBullet("法令。", "法令により求められた場合、データを開示することがあります。"),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "データの保存と削除",
      paragraphs: [
        "データはアプリを利用している間保存されます。アプリでリストを削除するとそのリストのメンバーから外れ、メンバーが一人もいなくなるとリスト自体が完全に削除されます。アカウントとそのすべてのデータの削除を希望する場合は、下記のアドレスまでメールでご連絡ください。30日以内に対応します。",
      ],
    ),
    LegalSection(
      heading: "Cookie",
      paragraphs: [
        "ウェブサイトは、ログイン状態の維持と設定の保存のため、ブラウザに少量のデータ（ローカルストレージ、およびログイン用にFirebase、Google、Facebookが設定するCookie）を保存します。これらはトラッキングや広告には使用されません。",
      ],
    ),
    LegalSection(
      heading: "セキュリティ",
      paragraphs: [
        "データは暗号化された接続で送信され、Googleのサーバーに保存されます。完全に安全な保存・送信方法は存在しないため、絶対的な安全性を保証することはできません。",
      ],
    ),
    LegalSection(
      heading: "お子様について",
      paragraphs: [
        "SyncedListは13歳未満のお子様を対象としておらず、お子様の個人情報を意図的に収集することはありません。お子様が個人情報を提供したと思われる場合はご連絡ください。削除いたします。",
      ],
    ),
    LegalSection(
      heading: "本ポリシーの変更",
      paragraphs: ["本ポリシーは随時更新されることがあります。変更内容は新しい施行日とともにこのページに掲載されます。"],
    ),
    LegalSection(
      heading: "お問い合わせ",
      paragraphs: ["ご質問・ご依頼："],
      links: [_contact],
    ),
  ],
);

const _termsJa = LegalDoc(
  title: "利用規約",
  effective: "2026年11月21日施行",
  sections: [
    LegalSection(
      paragraphs: [
        "本規約は、ovitaliyが提供する共有買い物リストの無料アプリSyncedListを、Android、iOS、またはウェブ（syncedlist.web.app）で利用する際に適用されます。アプリを利用することで、本規約に同意したものとみなされます。同意いただけない場合は、アプリを利用しないでください。",
      ],
    ),
    LegalSection(
      heading: "SyncedListの利用",
      paragraphs: [
        "アプリはGoogleまたはFacebookのアカウントで、あるいはアカウントなしで利用できます。リストに入力する内容、およびお使いのデバイスとアカウントの安全管理は、利用者ご自身の責任となります。違法な目的、他者への嫌がらせ、サービスや他者のデータへの妨害にアプリを使用しないでください。",
      ],
    ),
    LegalSection(
      heading: "リストの共有",
      paragraphs: [
        "リストを共有すると、リンクを開いた人は誰でもメンバーになり、リストを閲覧・変更できます。リンクを誰と共有するかは利用者の責任です。メンバーはいつでもリストから退出できます。",
      ],
    ),
    LegalSection(
      heading: "ゲストアカウント",
      paragraphs: [
        "アカウントなしでアプリを利用する場合、リストはそのデバイスのゲストセッションに紐づきます。ログアウト、アプリデータの消去、アプリのアンインストールを行うと、リストを復元できなくなることがあります。リストを残すには、アカウントメニューからGoogleまたはFacebookでログインしてください。",
      ],
    ),
    LegalSection(
      heading: "第三者のサービス",
      paragraphs: [
        "アプリは、独自の規約を持つサービスを利用しています。データの取り扱いについては、プライバシーポリシーをご覧ください。",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "アプリの権利",
      paragraphs: [
        "アプリ、その名称およびデザインはovitaliyに帰属します。アプリの複製、改変、再販売、リバースエンジニアリングを行わないでください。また、当方との関係を示唆する形でアプリの名称やブランドを使用しないでください。",
      ],
    ),
    LegalSection(
      heading: "提供状況と変更",
      paragraphs: [
        "SyncedListは無料かつ「現状のまま」提供されます。アプリが動作し、リストが同期されるよう努めていますが、常に利用可能であること、エラーがないこと、お使いのデバイスで動作することを約束するものではありません。一部の機能にはインターネット接続が必要で、通信事業者のデータ通信料がかかる場合があります。アプリはいつでも変更、更新、または提供終了することがあります。",
      ],
    ),
    LegalSection(
      heading: "責任",
      paragraphs: [
        "法令で認められる範囲において、ovitaliyは、アプリの利用または利用できなかったことにより生じたいかなる損失または損害（リストのデータの消失を含む）についても責任を負いません。",
      ],
    ),
    LegalSection(
      heading: "本規約の変更",
      paragraphs: [
        "本規約は随時更新されることがあります。変更内容は新しい施行日とともにこのページに掲載され、アプリの利用を継続した場合は変更に同意したものとみなされます。",
      ],
    ),
    LegalSection(heading: "お問い合わせ", paragraphs: ["ご質問："], links: [_contact]),
  ],
);
