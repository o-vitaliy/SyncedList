import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

const idKey = "id";
const nameKey = "name";

class Deeplink {
  static Future<Uri> createLink(String id, String name) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://syncedlist.page.link',
      link: Uri.parse(
          'https://syncedlist.page.link/link?$idKey=$id&$nameKey=$name'),
      androidParameters: const AndroidParameters(
        packageName: 'ua.ovi.shared_shopping_list',
      ),
      iosParameters: const IOSParameters(
        bundleId: 'ua.ovi.sharedshoppinglist',
      ),
    );

    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    final url = shortLink.shortUrl;
    print(url);
    return url;
  }
}
