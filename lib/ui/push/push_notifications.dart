import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/repos/auth_repo.dart';
import 'package:shopping_list/data/repos/push_repo.dart';
import 'package:shopping_list/data/sources/push/push_data_source.dart';
import 'package:shopping_list/main.dart';

import 'actions/push_action_open_list.dart';
import 'actions/push_action_received.dart';

/// Query parameter of the link a web push opens (functions/src/index.ts).
const openListParam = "openList";

/// Wires push notifications for shared lists (see functions/src/index.ts):
/// keeps this install's FID saved under the signed-in user, and opens the
/// list a tapped push is about. Called from `main`.
Future<void> initPushNotifications() async {
  final repo = GetIt.I.get<PushRepo>();

  // The web app is opened at /?openList=<id> when a push is tapped.
  if (kIsWeb) {
    final listId = Uri.base.queryParameters[openListParam];
    if (listId != null && listId.isNotEmpty) {
      mainStore.dispatch(PushActionOpenList(listId));
    }
  }

  if (!await repo.isSupported()) return;
  await repo.init();

  final source = GetIt.I.get<PushDataSource>();
  source.onRegistered.listen(repo.onRegistered);
  source.onUnregistered.listen(repo.onUnregistered);
  GetIt.I
      .get<AuthRepo>()
      .accountChanges()
      .map((account) => account?.uid)
      .distinct()
      .listen(repo.setUser);

  source.onMessage.listen(_onForeground);
  source.onMessageOpenedApp.listen(_onTap);
  final initial = await source.getInitialMessage();
  if (initial != null) _onTap(initial);
}

String? _listId(RemoteMessage message) {
  final id = message.data["listId"];
  return id is String && id.isNotEmpty ? id : null;
}

void _onTap(RemoteMessage message) {
  final listId = _listId(message);
  if (listId != null) mainStore.dispatch(PushActionOpenList(listId));
}

void _onForeground(RemoteMessage message) {
  final listId = _listId(message);
  if (listId == null) return;
  mainStore.dispatch(
    PushActionReceived(
      listId: listId,
      title: message.notification?.title,
      body: message.notification?.body,
    ),
  );
}
