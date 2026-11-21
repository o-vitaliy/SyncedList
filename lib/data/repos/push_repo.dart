import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/data/sources/prefs/prefs_data_source.dart';
import 'package:shopping_list/data/sources/push/push_data_source.dart';

const _fidKey = "pushFid";

/// Keeps `users/{uid}/devices/{fid}` pointing at the signed-in user, so
/// pushes for their shared lists reach this install, and only them.
class PushRepo {
  PushDataSource get _source => GetIt.I.get<PushDataSource>();

  PrefsDataSource get _prefs => GetIt.I.get<PrefsDataSource>();

  String? _uid;
  String? _fid;
  bool _registering = false;

  /// A list a tapped push asked to open before the user was signed in;
  /// opened once the start screen is up (see CheckLoginAction).
  String? pendingListId;

  Future<bool> isSupported() => _source.isSupported();

  /// Loads the FID saved by an earlier run, so a sign-in can be recorded
  /// before FCM reports it again.
  Future<void> init() async {
    _fid = await _prefs.getString(_fidKey);
  }

  /// Asks for notification permission and registers with FCM. Done once a
  /// user has a shared list, since only those get pushes.
  Future<void> enable() async {
    if (_registering) return;
    _registering = true;
    try {
      if (!await _source.isSupported()) return;
      if (!await _source.requestPermission()) return;
      await _source.register();
    } catch (e) {
      debugPrint("Push registration failed: $e");
      _registering = false;
    }
  }

  Future<void> onRegistered(String fid) async {
    final old = _fid;
    _fid = fid;
    await _prefs.setString(_fidKey, fid);
    final uid = _uid;
    if (uid == null) return;
    if (old != null && old != fid) await _quietly(_source.removeDevice(uid, old));
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
