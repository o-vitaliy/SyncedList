import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../localization.dart';

final _playStoreUrl = Uri.parse(
  'https://play.google.com/store/apps/details?id=ua.ovi.shared_shopping_list',
);

/// On the web, a button that opens the app's Google Play page. Elsewhere the
/// user already has the app, so it renders nothing.
class AndroidAppLink extends StatelessWidget {
  const AndroidAppLink({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const SizedBox.shrink();
    return TextButton.icon(
      onPressed: () => launchUrl(_playStoreUrl, webOnlyWindowName: '_blank'),
      icon: const Icon(Icons.android),
      label: Text(AppLocalizations.of(context).getAndroidApp),
    );
  }
}
