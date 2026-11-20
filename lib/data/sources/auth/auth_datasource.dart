import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_list/data/entities/account.dart';

/// Thrown when the user dismisses a sign-in flow without signing in.
class LoginCancelled implements Exception {}

const _popupCancelCodes = {'popup-closed-by-user', 'cancelled-popup-request'};

class AuthDataSource {
  late final FirebaseAuth _auth;
  Future<void>? _googleInit;

  AuthDataSource() {
    _auth = FirebaseAuth.instance;
  }

  Future<bool> isAuthorized() async {
    final user = await _auth.authStateChanges().first;
    return user != null;
  }

  /// Emits on sign-in, sign-out and profile changes such as linking.
  Stream<Account?> accountChanges() => _auth.userChanges().map(
    (user) => user == null
        ? null
        : Account(
            uid: user.uid,
            isAnonymous: user.isAnonymous,
            name: user.displayName,
            email: user.email,
            photoUrl: user.photoURL,
          ),
  );

  Future loginAsAnonymous() async {
    await _auth.signInAnonymously();
  }

  Future loginViaGoogle() async {
    // google_sign_in 7 doesn't support authenticate() on the web.
    if (kIsWeb) {
      return _cancellablePopup(
        () => _auth.signInWithPopup(GoogleAuthProvider()),
      );
    }
    return _auth.signInWithCredential(await _googleCredential());
  }

  Future loginViaFacebook() async {
    return _auth.signInWithCredential(await _facebookCredential());
  }

  /// Attaches Google to the current anonymous account so its lists are kept.
  Future<LinkResult> linkGoogle() async {
    final user = _auth.currentUser!;
    if (kIsWeb) {
      return _link(
        () => _cancellablePopup(() => user.linkWithPopup(GoogleAuthProvider())),
      );
    }
    final credential = await _googleCredential();
    return _link(() => user.linkWithCredential(credential), own: credential);
  }

  /// Attaches Facebook to the current anonymous account so its lists are kept.
  Future<LinkResult> linkFacebook() async {
    final user = _auth.currentUser!;
    final credential = await _facebookCredential();
    return _link(() => user.linkWithCredential(credential), own: credential);
  }

  Future<void> signOut() async {
    if (!kIsWeb) {
      try {
        await (_googleInit ??= GoogleSignIn.instance.initialize());
        await GoogleSignIn.instance.signOut();
      } catch (_) {
        // Not signed in with Google; nothing to clear.
      }
    }
    try {
      await FacebookAuth.instance.logOut();
    } catch (_) {
      // Not signed in with Facebook; nothing to clear.
    }
    await _auth.signOut();
  }

  String? userId() => _auth.currentUser?.uid;

  /// If the provider account already exists, linking fails; sign in to that
  /// existing account instead, and tell the caller to bring the lists along.
  /// On mobile we already hold the credential ([own]), so it's the fallback
  /// if Firebase doesn't return one with the error.
  Future<LinkResult> _link(
    Future<UserCredential> Function() link, {
    AuthCredential? own,
  }) async {
    try {
      await link();
      return LinkResult.linked;
    } on FirebaseAuthException catch (e) {
      final existing = e.credential ?? own;
      if (e.code == 'credential-already-in-use' && existing != null) {
        await _auth.signInWithCredential(existing);
        return LinkResult.switchedAccount;
      }
      rethrow;
    }
  }

  Future<UserCredential> _cancellablePopup(
    Future<UserCredential> Function() popup,
  ) async {
    try {
      return await popup();
    } on FirebaseAuthException catch (e) {
      if (_popupCancelCodes.contains(e.code)) throw LoginCancelled();
      rethrow;
    }
  }

  Future<AuthCredential> _googleCredential() async {
    final googleSignIn = GoogleSignIn.instance;
    await (_googleInit ??= googleSignIn.initialize());

    final GoogleSignInAccount googleUser;
    try {
      googleUser = await googleSignIn.authenticate();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) throw LoginCancelled();
      throw UserException(e.description ?? "Some thing went wrong");
    }

    return GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );
  }

  Future<AuthCredential> _facebookCredential() async {
    LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.cancelled) throw LoginCancelled();

    if (loginResult.status == LoginStatus.failed) {
      await FacebookAuth.instance.logOut();
      loginResult = await FacebookAuth.instance.login();
    }

    if (loginResult.status == LoginStatus.failed) {
      throw UserException(loginResult.message ?? "Some thing went wrong");
    }

    final accessToken = loginResult.accessToken;
    if (accessToken == null) throw LoginCancelled();

    return FacebookAuthProvider.credential(accessToken.tokenString);
  }
}
