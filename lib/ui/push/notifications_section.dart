import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';

import 'actions/push_action_enable.dart';
import 'actions/push_action_load.dart';
import 'push_prompt_card.dart';

/// The account sheet's notifications row: a button to turn them on (it must
/// come from a tap for Safari and Firefox to show the prompt), or what to do
/// when they're blocked or unavailable.
class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PushPermission>(
      converter: (store) => store.state.pushPermission,
      onInit: (store) => store.dispatch(PushActionLoad()),
      builder: (context, permission) {
        final body = _body(context, permission);
        if (body == null) return const SizedBox.shrink();
        final theme = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).notificationsTitle,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              body,
            ],
          ),
        );
      },
    );
  }

  Widget? _body(BuildContext context, PushPermission permission) {
    final l = AppLocalizations.of(context);
    switch (permission) {
      case PushPermission.notAsked:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Note(text: l.notificationsInfo),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: () => StoreProvider.dispatch<AppState>(
                context,
                PushActionEnable(fromTap: true),
              ),
              icon: const Icon(Icons.notifications_outlined),
              label: Text(l.notificationsTurnOn),
            ),
          ],
        );
      case PushPermission.granted:
        return _Note(
          icon: Icons.notifications_active_outlined,
          text: l.notificationsOn,
        );
      case PushPermission.denied:
        return _Note(
          icon: Icons.notifications_off_outlined,
          text: kIsWeb ? l.notificationsBlockedWeb : l.notificationsBlockedApp,
        );
      case PushPermission.unsupported:
        return isIosBrowser
            ? _Note(
                icon: Icons.add_to_home_screen_outlined,
                text: l.notificationsIosHomeScreen,
              )
            : null;
    }
  }
}

class _Note extends StatelessWidget {
  final IconData? icon;
  final String text;

  const _Note({this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurfaceVariant;
    final label = Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(color: color),
    );
    final icon = this.icon;
    if (icon == null) return label;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Expanded(child: label),
      ],
    );
  }
}
