import 'package:async_redux/async_redux.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/app.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/main.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

import 'push_action_mark_seen.dart';
import 'push_action_open_list.dart';

/// A push that arrived while the app was open (the system doesn't show those).
/// If its list is on screen, the user is already looking at the changes;
/// otherwise it is shown as a snack bar that opens the list.
class PushActionReceived extends ReduxAction<AppState> {
  final String listId;
  final String? title;
  final String? body;

  PushActionReceived({required this.listId, this.title, this.body});

  @override
  AppState? reduce() {
    if (state.itemListState?.list.id == listId) {
      dispatch(PushActionMarkSeen(listId));
      return null;
    }

    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) return null;
    final text = [title, body].whereType<String>().join("\n");
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text, maxLines: 4, overflow: TextOverflow.ellipsis),
        duration: const Duration(seconds: 6),
        action: SnackBarAction(
          label: AppLocalizations.of(context).openList,
          onPressed: () => mainStore.dispatch(PushActionOpenList(listId)),
        ),
      ),
    );
    return null;
  }
}
