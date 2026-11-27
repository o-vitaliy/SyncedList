import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:material_ui/material_ui.dart';

/// A browser on iPhone, where web push only works in a Home Screen app.
bool get isIosBrowser => kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

/// The card the notification prompts use (above the lists, and on a shared
/// list): an icon, a message and buttons, in the secondary container colors.
class PushPromptCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Widget> actions;

  const PushPromptCard({
    super.key,
    required this.icon,
    required this.text,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Card.filled(
        color: scheme.secondaryContainer,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: scheme.onSecondaryContainer),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        text,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                spacing: 8,
                children: actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
