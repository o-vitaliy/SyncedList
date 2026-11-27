import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';

import 'actions/push_action_dismiss_banner.dart';
import 'actions/push_action_enable.dart';

/// Offers to turn notifications on above the lists, once the user has a
/// shared list and hasn't been asked yet. On the web this is how most people
/// get asked, since the browser prompt has to come from a tap.
class PushBanner extends StatelessWidget {
  const PushBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) {
        final s = store.state;
        final shared = s.userListState?.list.any((l) => l.shared) ?? false;
        return shared &&
            s.pushPermission == PushPermission.notAsked &&
            !s.pushBannerDismissed;
      },
      builder: (context, show) => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.topCenter,
        child: show ? const _Banner() : const SizedBox(width: double.infinity),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
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
                  Icon(
                    Icons.notifications_outlined,
                    color: scheme.onSecondaryContainer,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        l.notificationsInfo,
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
                children: [
                  TextButton(
                    onPressed: () => StoreProvider.dispatch<AppState>(
                      context,
                      PushActionDismissBanner(),
                    ),
                    child: Text(l.notNow),
                  ),
                  FilledButton(
                    onPressed: () => StoreProvider.dispatch<AppState>(
                      context,
                      PushActionEnable(fromTap: true),
                    ),
                    child: Text(l.notificationsTurnOnShort),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
