part of '../legal_content.dart';

const _privacyId = LegalDoc(
  title: "Kebijakan Privasi",
  effective: "Berlaku sejak 21 November 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "SyncedList adalah aplikasi gratis untuk daftar belanja bersama buatan ovitaliy, tersedia di Android, iOS, dan web di syncedlist.web.app. Kebijakan ini menjelaskan data apa yang ditangani aplikasi, untuk apa, dan dengan siapa data itu dibagikan. Dengan menggunakan SyncedList, Anda menyetujuinya.",
      ],
    ),
    LegalSection(
      heading: "Data yang kami kumpulkan",
      bullets: [
        LegalBullet(
          "Detail akun.",
          "Jika Anda masuk dengan Google atau Facebook, kami menerima nama, alamat email, dan foto profil Anda dari penyedia tersebut. Jika Anda melanjutkan tanpa akun, kami membuat akun anonim dengan ID acak dan tanpa data pribadi.",
        ),
        LegalBullet(
          "Daftar Anda.",
          "Nama daftar dan barangnya, urutannya dan apakah sudah dicentang, serta akun mana saja yang menjadi anggota setiap daftar.",
        ),
        LegalBullet(
          "Laporan error.",
          "Saat aplikasi berhenti mendadak atau mengalami error, aplikasi mengirim laporan berisi detail seperti model perangkat, versi sistem operasi, versi aplikasi, dan kondisi aplikasi saat itu.",
        ),
        LegalBullet(
          "Pengaturan di perangkat Anda.",
          "Tema, urutan sortir barang, dan undangan daftar yang tertunda hanya disimpan di perangkat Anda.",
        ),
      ],
    ),
    LegalSection(
      heading: "Cara kami menggunakannya",
      paragraphs: [
        "Kami menggunakan data ini hanya untuk menjalankan aplikasi: untuk memasukkan Anda ke akun, menyimpan daftar Anda dan menyinkronkannya di semua perangkat Anda serta dengan orang yang Anda ajak berbagi, dan untuk menemukan serta memperbaiki bug. Kami tidak menjual data Anda, tidak menampilkan iklan, dan tidak menggunakannya untuk pemasaran.",
      ],
    ),
    LegalSection(
      heading: "Siapa yang dapat melihatnya",
      bullets: [
        LegalBullet(
          "Orang yang Anda ajak berbagi daftar.",
          "Siapa pun yang membuka tautan berbagi sebuah daftar akan menjadi anggota dan dapat melihat serta mengeditnya. Bagikan tautan hanya kepada orang yang Anda percayai.",
        ),
        LegalBullet(
          "Penyedia layanan.",
          "SyncedList berjalan di Google Firebase: Firebase Authentication (masuk), Cloud Firestore (penyimpanan daftar), Firebase Crashlytics (laporan error), dan Firebase Hosting (situs web). Masuk dengan Google atau Facebook juga melalui perusahaan tersebut. Masing-masing memproses data sesuai kebijakannya sendiri.",
        ),
        LegalBullet(
          "Hukum.",
          "Kami dapat mengungkapkan data jika diwajibkan oleh hukum.",
        ),
      ],
      links: [_firebasePrivacy, _googlePrivacy, _facebookPrivacy],
    ),
    LegalSection(
      heading: "Penyimpanan dan penghapusan data",
      paragraphs: [
        "Data Anda disimpan selama Anda menggunakan aplikasi. Menghapus daftar di aplikasi akan mengeluarkan Anda dari daftar itu, dan daftar tersebut dihapus sepenuhnya setelah tidak ada anggota tersisa. Untuk menghapus akun Anda beserta semua datanya, kirim email ke alamat di bawah dan kami akan melakukannya dalam 30 hari.",
      ],
    ),
    LegalSection(
      heading: "Cookie",
      paragraphs: [
        "Situs web menyimpan sedikit data di browser Anda (penyimpanan lokal dan, untuk masuk, cookie dari Firebase, Google, atau Facebook) agar Anda tetap masuk dan pengaturan Anda diingat. Data ini tidak digunakan untuk pelacakan atau iklan.",
      ],
    ),
    LegalSection(
      heading: "Keamanan",
      paragraphs: [
        "Data dikirim melalui koneksi terenkripsi dan disimpan di server Google. Tidak ada metode penyimpanan atau pengiriman yang sepenuhnya aman, jadi kami tidak dapat menjamin keamanan mutlak.",
      ],
    ),
    LegalSection(
      heading: "Anak-anak",
      paragraphs: [
        "SyncedList tidak ditujukan untuk anak di bawah 13 tahun, dan kami tidak dengan sengaja mengumpulkan data pribadi mereka. Jika Anda yakin seorang anak telah memberikan data pribadi kepada kami, hubungi kami dan kami akan menghapusnya.",
      ],
    ),
    LegalSection(
      heading: "Perubahan kebijakan ini",
      paragraphs: [
        "Kami dapat memperbarui kebijakan ini dari waktu ke waktu. Perubahan dipublikasikan di halaman ini dengan tanggal berlaku yang baru.",
      ],
    ),
    LegalSection(
      heading: "Kontak",
      paragraphs: ["Pertanyaan atau permintaan:"],
      links: [_contact],
    ),
  ],
);

const _termsId = LegalDoc(
  title: "Ketentuan Penggunaan",
  effective: "Berlaku sejak 21 November 2026",
  sections: [
    LegalSection(
      paragraphs: [
        "Ketentuan ini berlaku saat Anda menggunakan SyncedList, aplikasi gratis untuk daftar belanja bersama buatan ovitaliy, di Android, iOS, atau web di syncedlist.web.app. Dengan menggunakan aplikasi ini, Anda menyetujuinya. Jika tidak setuju, mohon jangan gunakan aplikasi ini.",
      ],
    ),
    LegalSection(
      heading: "Menggunakan SyncedList",
      paragraphs: [
        "Anda dapat menggunakan aplikasi dengan akun Google atau Facebook, atau tanpa akun. Anda bertanggung jawab atas isi daftar Anda serta keamanan perangkat dan akun Anda. Jangan gunakan aplikasi untuk hal ilegal, melecehkan orang lain, atau mengganggu layanan maupun data orang lain.",
      ],
    ),
    LegalSection(
      heading: "Berbagi daftar",
      paragraphs: [
        "Saat Anda membagikan daftar, siapa pun yang membuka tautannya menjadi anggota dan dapat melihat serta mengubahnya. Anda bertanggung jawab atas siapa saja yang menerima tautan dari Anda. Anggota dapat keluar dari daftar kapan saja.",
      ],
    ),
    LegalSection(
      heading: "Akun tamu",
      paragraphs: [
        "Jika Anda menggunakan aplikasi tanpa akun, daftar Anda terikat pada sesi tamu di perangkat tersebut. Keluar, menghapus data aplikasi, atau mencopot aplikasi dapat membuat daftar tidak bisa dipulihkan. Masuk dengan Google atau Facebook dari menu akun untuk menyimpannya.",
      ],
    ),
    LegalSection(
      heading: "Layanan pihak ketiga",
      paragraphs: [
        "Aplikasi ini bergantung pada layanan yang memiliki ketentuannya sendiri. Cara kami menangani data Anda dijelaskan dalam Kebijakan Privasi.",
      ],
      links: [_firebaseTerms, _googleTerms, _facebookTerms],
    ),
    LegalSection(
      heading: "Aplikasi ini",
      paragraphs: [
        "Aplikasi, namanya, dan desainnya milik ovitaliy. Jangan menyalin, mengubah, menjual kembali, atau merekayasa balik aplikasi ini, dan jangan menggunakan nama atau mereknya dengan cara yang mengesankan adanya hubungan dengan kami.",
      ],
    ),
    LegalSection(
      heading: "Ketersediaan dan perubahan",
      paragraphs: [
        "SyncedList disediakan gratis dan \"apa adanya\". Kami berupaya agar aplikasi tetap berjalan dan daftar Anda tetap tersinkron, tetapi kami tidak dapat menjanjikan aplikasi akan selalu tersedia, bebas error, atau kompatibel dengan perangkat Anda. Beberapa fitur memerlukan koneksi internet, dan operator seluler Anda mungkin mengenakan biaya data. Kami dapat mengubah, memperbarui, atau menghentikan aplikasi kapan saja.",
      ],
    ),
    LegalSection(
      heading: "Tanggung jawab",
      paragraphs: [
        "Sejauh diizinkan oleh hukum, ovitaliy tidak bertanggung jawab atas kerugian atau kerusakan apa pun yang timbul dari penggunaan atau ketidakmampuan menggunakan aplikasi, termasuk hilangnya data daftar.",
      ],
    ),
    LegalSection(
      heading: "Perubahan ketentuan ini",
      paragraphs: [
        "Kami dapat memperbarui ketentuan ini dari waktu ke waktu. Perubahan dipublikasikan di halaman ini dengan tanggal berlaku yang baru, dan dengan terus menggunakan aplikasi berarti Anda menerimanya.",
      ],
    ),
    LegalSection(
      heading: "Kontak",
      paragraphs: ["Pertanyaan:"],
      links: [_contact],
    ),
  ],
);
