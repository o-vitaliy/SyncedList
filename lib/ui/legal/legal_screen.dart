import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'legal_content.dart';

/// Shows the Terms of Use or Privacy Policy (routes `/terms` and `/privacy`).
class LegalScreen extends StatelessWidget {
  final LegalDocType type;

  const LegalScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final doc = legalDoc(type, Localizations.localeOf(context).languageCode);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(doc.title)),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 48),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.effective,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                    for (final section in doc.sections)
                      _Section(section: section),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final LegalSection section;

  const _Section({required this.section});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final body = theme.textTheme.bodyLarge?.copyWith(height: 1.5);
    final heading = section.heading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: heading == null ? 16 : 28),
        if (heading != null) ...[
          Text(
            heading,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        for (final p in section.paragraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(p, style: body),
          ),
        for (final b in section.bullets)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: body),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: body,
                      children: [
                        if (b.lead != null)
                          TextSpan(
                            text: '${b.lead} ',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        TextSpan(text: b.text),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (section.links.isNotEmpty)
          Wrap(
            spacing: 8,
            children: [
              for (final link in section.links)
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(link.url)),
                  icon: Icon(
                    link.url.startsWith('mailto:')
                        ? Icons.mail_outline
                        : Icons.open_in_new,
                    size: 18,
                  ),
                  label: Text(link.label),
                ),
            ],
          ),
      ],
    );
  }
}
