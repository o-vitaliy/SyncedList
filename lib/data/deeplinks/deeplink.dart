import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

const idKey = "id";
const nameKey = "name";

class Deeplink {
  static Future<Uri> createLink(String id, String name) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://syncedlist.page.link',
      link: Uri.parse(
          'https://syncedlist.page.link/link?$idKey=$id&$nameKey=$name'),
      androidParameters: AndroidParameters(
        packageName: 'ua.ovi.shared_shopping_list',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'ua.ovi.sharedshoppinglist',
        minimumVersion: '0',
      ),
    );

    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    final url = shortLink.shortUrl;
    print(url);
    return url;
  }
}
