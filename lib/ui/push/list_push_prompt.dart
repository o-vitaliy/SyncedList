import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/state/app_state.dart';

import 'actions/push_action_enable.dart';
import 'push_prompt_card.dart';

/// Shown on a shared list when this device won't get its notifications:
/// "Turn on" when the user hasn't been asked, how to unblock them when they
/// turned them off, or, in iPhone browsers, adding the app to the Home
/// Screen. It shows on every visit to a shared list until fixed; "Not now" /
/// "Ok" only hide it for this visit.
///
/// The permission is read again when the list opens and when the app comes
/// back to the foreground, so turning notifications on in the browser or
/// system settings hides it (and registers this device) right away.
class ListPushPrompt extends StatefulWidget {
  const ListPushPrompt({super.key});

  @override
  State<ListPushPrompt> createState() => _ListPushPromptState();
}

class _ListPushPromptState extends State<ListPushPrompt> {
  bool _dismissed = false;
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: _refresh);
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  /// Re-reads the permission, and registers if it's now granted (on mobile
  /// this also asks if the user hasn't been asked yet).
  void _refresh() {
    if (!mounted) return;
    StoreProvider.dispatch<AppState>(context, PushActionEnable());
  }

  void _dismiss() => setState(() => _dismissed = true);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PushPermission>(
      converter: (store) => store.state.pushPermission,
      onInit: (store) => store.dispatch(PushActionEnable()),
      builder: (context, permission) => AnimatedSize(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.topCenter,
        child:
            (_dismissed ? null : _card(context, permission)) ??
            const SizedBox(width: double.infinity),
      ),
    );
  }

  Widget? _card(BuildContext context, PushPermission permission) {
    final l = AppLocalizations.of(context);
    final ok = TextButton(onPressed: _dismiss, child: Text(l.ok));
    switch (permission) {
      case PushPermission.granted:
        return null;
      case PushPermission.notAsked:
        return PushPromptCard(
          icon: Icons.notifications_outlined,
          text: l.notificationsInfo,
          actions: [
            TextButton(onPressed: _dismiss, child: Text(l.notNow)),
            FilledButton(
              onPressed: () => StoreProvider.dispatch<AppState>(
                context,
                PushActionEnable(fromTap: true),
              ),
              child: Text(l.notificationsTurnOnShort),
            ),
          ],
        );
      case PushPermission.denied:
        return PushPromptCard(
          icon: Icons.notifications_off_outlined,
          text: kIsWeb ? l.notificationsBlockedWeb : l.notificationsBlockedApp,
          actions: [ok],
        );
      case PushPermission.unsupported:
        return isIosBrowser
            ? PushPromptCard(
                icon: Icons.add_to_home_screen_outlined,
                text: l.notificationsIosHomeScreen,
                actions: [ok],
              )
            : null;
    }
  }
}
