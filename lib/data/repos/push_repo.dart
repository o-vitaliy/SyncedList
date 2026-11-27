import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/entities/push_permission.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';
import 'package:shopping_list/data/sources/push/push_data_source.dart';

const _fidKey = "pushFid";
const _bannerKey = "pushBannerDismissed";

/// Keeps `users/{uid}/devices/{fid}` pointing at the signed-in user, so
/// pushes for their shared lists reach this install, and only them.
class PushRepo {
  PushDataSource get _source => GetIt.I.get<PushDataSource>();

  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  String? _uid;
  String? _fid;
  bool _registered = false;

  /// A list a tapped push asked to open before the user was signed in;
  /// opened once the start screen is up (see CheckLoginAction).
  String? pendingListId;

  Future<bool> isSupported() => _source.isSupported();

  /// Loads the FID saved by an earlier run, so a sign-in can be recorded
  /// before FCM reports it again.
  Future<void> init() async {
    _fid = await _prefs.getString(_fidKey);
  }

  Future<PushPermission> permission() async {
    try {
      return await _source.permission();
    } catch (e) {
      debugPrint("Couldn't read notification permission: $e");
      return PushPermission.unsupported;
    }
  }

  /// Registers with FCM, first asking for notification permission if
  /// [ask] is set. Returns the permission it ended with.
  Future<PushPermission> enable({required bool ask}) async {
    var permission = await this.permission();
    if (permission == PushPermission.notAsked && ask) {
      try {
        permission = await _source.requestPermission();
      } catch (e) {
        debugPrint("Notification permission request failed: $e");
      }
    }
    if (permission == PushPermission.granted && !_registered) {
      try {
        await _source.register();
        _registered = true;
      } catch (e) {
        debugPrint("Push registration failed: $e");
      }
    }
    return permission;
  }

  Future<bool> bannerDismissed() => _prefs.getBool(_bannerKey);

  Future<void> dismissBanner() => _prefs.setBool(_bannerKey, true);

  Future<void> onRegistered(String fid) async {
    final old = _fid;
    _fid = fid;
    await _prefs.setString(_fidKey, fid);
    final uid = _uid;
    if (uid == null) return;
    if (old != null && old != fid) {
      await _quietly(_source.removeDevice(uid, old));
    }
    await _quietly(_source.saveDevice(uid, fid));
  }

  Future<void> onUnregistered(String fid) async {
    final uid = _uid;
    if (uid != null) await _quietly(_source.removeDevice(uid, fid));
  }

  /// Moves this install to [uid]. Called for every auth change, including a
  /// guest switching to an existing account.
  Future<void> setUser(String? uid) async {
    final old = _uid;
    if (old == uid) return;
    _uid = uid;
    final fid = _fid;
    if (fid == null) return;
    if (old != null) await _quietly(_source.removeDevice(old, fid));
    if (uid != null) await _quietly(_source.saveDevice(uid, fid));
  }

  /// Stops pushes to this install; call before signing out, while the
  /// user may still write their docs.
  Future<void> signOut() async {
    final uid = _uid;
    final fid = _fid;
    _uid = null;
    if (uid != null && fid != null) {
      await _quietly(_source.removeDevice(uid, fid));
    }
  }

  /// Clears the running total of others' changes for [listId].
  Future<void> markSeen(String listId) async {
    final uid = _uid;
    if (uid != null) await _quietly(_source.markSeen(listId, uid));
  }

  Future<void> _quietly(Future<void> f) async {
    try {
      await f;
    } catch (e) {
      debugPrint("Push device update failed: $e");
    }
  }
}
