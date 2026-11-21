import 'package:material_ui/material_ui.dart';

import '../../localization.dart';

/// Links to the in-app Terms of Use and Privacy Policy screens
/// (`lib/ui/legal/`).
class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
      textStyle: Theme.of(context).textTheme.bodySmall,
      visualDensity: VisualDensity.compact,
    );
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        TextButton(
          style: style,
          onPressed: () => Navigator.of(context).pushNamed('/terms'),
          child: Text(l.termsOfUse),
        ),
        TextButton(
          style: style,
          onPressed: () => Navigator.of(context).pushNamed('/privacy'),
          child: Text(l.privacyPolicy),
        ),
      ],
    );
  }
}
