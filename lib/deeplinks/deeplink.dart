const idKey = "id";
const nameKey = "name";

/// Host that serves the share links (Firebase Hosting site "syncedlist").
/// Android App Links and iOS Universal Links are verified against this host
/// via /.well-known/assetlinks.json and /.well-known/apple-app-site-association.
const linkHost = "syncedlist.web.app";
const linkPath = "/link";

class Deeplink {
  static Uri createLink(String id, String name) =>
      Uri.https(linkHost, linkPath, {idKey: id, nameKey: name});

  static bool isListLink(Uri uri) =>
      uri.host == linkHost && uri.path == linkPath;
}
