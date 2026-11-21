part of '../legal_content.dart';

const _privacyTr = LegalDoc(
  title: "Gizlilik Politikası",
  effective: "Yürürlük tarihi: 21 Kasım 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList, ovitaliy tarafından geliştirilen, Android, iOS ve web üzerinde syncedlist.web.app adresinde kullanılabilen ücretsiz bir ortak alışveriş listesi uygulamasıdır. Bu politika, uygulamanın hangi verileri neden işlediğini ve kimlerle paylaştığını açıklar. SyncedList'i kullanarak bu politikayı kabul etmiş olursun.",
      ],
    ),
    LegalSection(
      heading: "Topladığımız veriler",
      bullets: [
        LegalBullet(
          "Hesap bilgileri.",
          "Google veya Facebook ile giriş yaparsan, bu sağlayıcıdan adını, e-posta adresini ve profil fotoğrafını alırız. Hesap olmadan devam edersen, rastgele bir kimlikle ve kişisel bilgi içermeyen anonim bir hesap oluştururuz.",
        ),
        LegalBullet(
          "Listelerin.",
          "Liste adları ve ürünler, sıraları ve işaretlenip işaretlenmedikleri, ayrıca her listenin üyesi olan hesaplar.",
        ),
        LegalBullet(
          "Çökme raporları.",
          "Uygulama çöktüğünde veya bir hatayla karşılaştığında; cihaz modeli, işletim sistemi sürümü, uygulama sürümü ve uygulamanın o anki durumu gibi bilgileri içeren bir rapor gönderir.",
        ),
        LegalBullet(
          "Cihazındaki ayarlar.",
          "Temanı, ürün sıralamanı ve bekleyen liste davetlerini yalnızca cihazında saklarız.",
        ),
      ],
    ),
    LegalSection(
      heading: "Verileri nasıl kullanıyoruz",
      paragraphs: [
        "Bu verileri yalnızca uygulamayı çalıştırmak için kullanırız: giriş yapmanı sağlamak, listelerini saklamak ve onları cihazların arasında ve paylaştığın kişilerle senkronize tutmak, ayrıca hataları bulup düzeltmek için. Verilerini satmayız, reklam göstermeyiz ve pazarlama için kullanmayız.",
      ],
    ),
    LegalSection(
      heading: "Verileri kimler görebilir",
      bullets: [
        LegalBullet(
          "Liste paylaştığın kişiler.",
          "Bir listenin paylaşım bağlantısını açan herkes o listenin üyesi olur ve listeyi görüp düzenleyebilir. Bağlantıları yalnızca güvendiğin kişilerle paylaş.",
        ),
        LegalBullet(
          "Hizmet sağlayıcılar.",
          "SyncedList, Google Firebase üzerinde çalışır: Firebase Authentication (giriş), Cloud Firestore (liste depolama), Firebase Crashlytics (çökme raporları) ve Firebase Hosting (web sitesi). Google veya Facebook ile giriş de bu şirketler üzerinden yapılır. Her biri verileri kendi politikasına göre işler.",
        ),
        LegalBullet(
          "Yasalar.",
          "Yasaların gerektirdiği durumlarda verileri açıklayabiliriz.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Verilerin saklanması ve silinmesi",
      paragraphs: [
        "Verilerin, uygulamayı kullandığın sürece saklanır. Uygulamada bir listeyi silmek seni o listeden çıkarır; listede hiç üye kalmadığında liste tamamen silinir. Hesabının ve tüm verilerinin silinmesini istersen aşağıdaki adrese e-posta gönder, 30 gün içinde sileriz.",
      ],
    ),
    LegalSection(
      heading: "Çerezler",
      paragraphs: [
        "Web sitesi, oturumunu açık tutmak ve ayarlarını hatırlamak için tarayıcında küçük veriler saklar (yerel depolama ve giriş için Firebase, Google veya Facebook tarafından ayarlanan çerezler). Bunlar izleme veya reklam için kullanılmaz.",
      ],
    ),
    LegalSection(
      heading: "Güvenlik",
      paragraphs: [
        "Veriler şifreli bağlantılar üzerinden gönderilir ve Google'ın sunucularında saklanır. Hiçbir depolama veya aktarım yöntemi tamamen güvenli değildir, bu nedenle mutlak güvenliği garanti edemeyiz.",
      ],
    ),
    LegalSection(
      heading: "Çocuklar",
      paragraphs: [
        "SyncedList 13 yaşından küçük çocuklara yönelik değildir ve onların kişisel verilerini bilerek toplamayız. Bir çocuğun bize kişisel veri verdiğini düşünüyorsan bizimle iletişime geç, bu verileri sileriz.",
      ],
    ),
    LegalSection(
      heading: "Bu politikadaki değişiklikler",
      paragraphs: [
        "Bu politikayı zaman zaman güncelleyebiliriz. Değişiklikler bu sayfada yeni bir yürürlük tarihiyle yayımlanır.",
      ],
    ),
    LegalSection(
      heading: "İletişim",
      paragraphs: ["Sorular veya talepler:"],
      links: [_contact],
    ),
  ],
);

const _termsTr = LegalDoc(
  title: "Kullanım Koşulları",
  effective: "Yürürlük tarihi: 21 Kasım 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Bu koşullar, ovitaliy tarafından geliştirilen ücretsiz ortak alışveriş listesi uygulaması SyncedList'i Android, iOS veya web üzerinde syncedlist.web.app adresinde kullandığında geçerlidir. Uygulamayı kullanarak bu koşulları kabul etmiş olursun. Kabul etmiyorsan lütfen uygulamayı kullanma.",
      ],
    ),
    LegalSection(
      heading: "SyncedList'i kullanma",
      paragraphs: [
        "Uygulamayı bir Google veya Facebook hesabıyla ya da hesap olmadan kullanabilirsin. Listelerine eklediklerinden ve cihazının ve hesaplarının güvenliğinden sen sorumlusun. Uygulamayı yasa dışı amaçlarla, başkalarını rahatsız etmek için veya hizmete ya da başkalarının verilerine müdahale etmek için kullanma.",
      ],
    ),
    LegalSection(
      heading: "Liste paylaşma",
      paragraphs: [
        "Bir listeyi paylaştığında, bağlantıyı açan herkes üye olur ve listeyi görüp değiştirebilir. Bağlantıları kiminle paylaştığından sen sorumlusun. Üyeler istedikleri zaman listeden ayrılabilir.",
      ],
    ),
    LegalSection(
      heading: "Misafir hesapları",
      paragraphs: [
        "Uygulamayı hesap olmadan kullanırsan, listelerin o cihazdaki misafir oturumuna bağlıdır. Çıkış yapmak, uygulama verilerini temizlemek veya uygulamayı kaldırmak listelerinin geri getirilememesine yol açabilir. Onları korumak için hesap menüsünden Google veya Facebook ile giriş yap.",
      ],
    ),
    LegalSection(
      heading: "Üçüncü taraf hizmetler",
      paragraphs: [
        "Uygulama, kendi koşulları olan hizmetlere dayanır. Verilerini nasıl işlediğimiz Gizlilik Politikası'nda açıklanmıştır.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "Uygulamanın kendisi",
      paragraphs: [
        "Uygulama, adı ve tasarımı ovitaliy'ye aittir. Uygulamayı kopyalama, değiştirme, yeniden satma veya tersine mühendislik uygulama; adını veya markasını bizimle bir bağlantı varmış gibi gösterecek şekilde kullanma.",
      ],
    ),
    LegalSection(
      heading: "Erişilebilirlik ve değişiklikler",
      paragraphs: [
        "SyncedList ücretsiz ve \"olduğu gibi\" sunulur. Uygulamanın çalışması ve listelerinin senkronize kalması için çalışıyoruz, ancak her zaman erişilebilir, hatasız veya cihazınla uyumlu olacağına söz veremeyiz. Bazı özellikler internet bağlantısı gerektirir ve operatörün veri ücreti alabilir. Uygulamayı istediğimiz zaman değiştirebilir, güncelleyebilir veya durdurabiliriz.",
      ],
    ),
    LegalSection(
      heading: "Sorumluluk",
      paragraphs: [
        "Yasaların izin verdiği ölçüde ovitaliy, uygulamanın kullanılmasından veya kullanılamamasından doğan, liste verilerinin kaybı dahil hiçbir kayıp veya zarardan sorumlu değildir.",
      ],
    ),
    LegalSection(
      heading: "Bu koşullardaki değişiklikler",
      paragraphs: [
        "Bu koşulları zaman zaman güncelleyebiliriz. Değişiklikler bu sayfada yeni bir yürürlük tarihiyle yayımlanır; uygulamayı kullanmaya devam etmen bunları kabul ettiğin anlamına gelir.",
      ],
    ),
    LegalSection(
      heading: "İletişim",
      paragraphs: ["Sorular:"],
      links: [_contact],
    ),
  ],
);
