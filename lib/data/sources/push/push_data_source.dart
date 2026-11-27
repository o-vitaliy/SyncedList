import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_list/data/entities/push_permission.dart';

/// Firebase Cloud Messaging, plus the Firestore docs the push function
/// (functions/src/index.ts) reads:
/// - `users/{uid}/devices/{fid}`: `{platform, locale, updatedAt}`, one per
///   app install the user is signed in on, keyed by its Firebase Installation
///   ID (FID), which FCM sends to.
/// - `notifications/{listId}.unseen.{uid}`: what others changed in the list
///   since the user last opened it; cleared by [markSeen].
class PushDataSource {
  FirebaseMessaging get _messaging => FirebaseMessaging.instance;

  FirebaseFirestore get _store => FirebaseFirestore.instance;

  Future<bool> isSupported() => _messaging.isSupported();

  /// The current permission, without asking.
  Future<PushPermission> permission() async {
    if (!await isSupported()) return PushPermission.unsupported;
    return _toPermission(await _messaging.getNotificationSettings());
  }

  /// Asks for permission to show notifications (once; later calls return the
  /// saved answer). Safari and Firefox only show the prompt when this runs
  /// from a tap.
  Future<PushPermission> requestPermission() async =>
      _toPermission(await _messaging.requestPermission());

  static PushPermission _toPermission(NotificationSettings settings) =>
      switch (settings.authorizationStatus) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional => PushPermission.granted,
        AuthorizationStatus.denied ||
        AuthorizationStatus.deniedPermanently => PushPermission.denied,
        AuthorizationStatus.notDetermined => PushPermission.notAsked,
      };

  /// Registers this install with FCM; its FID arrives on [onRegistered].
  Future<void> register() => _messaging.register();

  Stream<String> get onRegistered => _messaging.onRegistered;

  Stream<String> get onUnregistered => _messaging.onUnregistered;

  /// A push that came in while the app was in the foreground. The system
  /// doesn't show it then.
  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  /// A tap on a push while the app was in the background.
  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  /// The push whose tap launched the app, if any (null on the web).
  Future<RemoteMessage?> getInitialMessage() => _messaging.getInitialMessage();

  Future<void> saveDevice(String uid, String fid) {
    return _store.doc("users/$uid/devices/$fid").set(<String, dynamic>{
      "platform": kIsWeb ? "web" : defaultTargetPlatform.name,
      "locale": PlatformDispatcher.instance.locale.toLanguageTag(),
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }

  /// Whether the push function found that FCM no longer knows [fid] (it
  /// marks such devices instead of deleting them).
  Future<bool> isMarkedUnregistered(String uid, String fid) async {
    final doc = await _store.doc("users/$uid/devices/$fid").get();
    return doc.exists && doc.data()?["unregisteredAt"] != null;
  }

  /// Drops this install's Firebase Installation, so the next registration
  /// gets a new FID that FCM registers from scratch. The web SDK would
  /// otherwise keep reusing its cached registration of the old FID for up to
  /// 7 days, even after FCM dropped it.
  Future<void> resetInstallation() => FirebaseInstallations.instance.delete();

  Future<void> removeDevice(String uid, String fid) =>
      _store.doc("users/$uid/devices/$fid").delete();

  Future<void> markSeen(String listId, String uid) async {
    try {
      await _store.doc("notifications/$listId").update(<String, dynamic>{
        "unseen.$uid": FieldValue.delete(),
      });
    } on FirebaseException catch (e) {
      // No notification doc yet: nothing to clear.
      if (e.code != "not-found") rethrow;
    }
  }
}
