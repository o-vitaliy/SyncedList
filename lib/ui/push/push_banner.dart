import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';

import 'actions/push_action_dismiss_banner.dart';
import 'actions/push_action_enable.dart';
import 'push_prompt_card.dart';

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
      builder: (context, show) {
        final l = AppLocalizations.of(context);
        return AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: show
              ? PushPromptCard(
                  icon: Icons.notifications_outlined,
                  text: l.notificationsInfo,
                  actions: [
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
                )
              : const SizedBox(width: double.infinity),
        );
      },
    );
  }
}
