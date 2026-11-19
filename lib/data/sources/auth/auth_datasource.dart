import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future loginAsAnonymous() async {
    await _auth.signInAnonymously();
  }

  Future loginViaGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    await (_googleInit ??= googleSignIn.initialize());

    final GoogleSignInAccount googleUser;
    try {
      googleUser = await googleSignIn.authenticate();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      throw UserException(e.description ?? "Some thing went wrong");
    }

    final credential = GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future loginViaFacebook() async {
    LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.failed) {
      await FacebookAuth.instance.logOut();
      loginResult = await FacebookAuth.instance.login();
    }

    if (loginResult.status == LoginStatus.failed) {
      throw UserException(loginResult.message ?? "Some thing went wrong");
    }

    final accessToken = loginResult.accessToken;
    if (accessToken == null) return null;

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.tokenString);

    return _auth.signInWithCredential(facebookAuthCredential);
  }

  String? userId() => _auth.currentUser?.uid;
}
