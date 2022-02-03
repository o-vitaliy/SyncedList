import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
  late final FirebaseAuth _auth;

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
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
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

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return _auth.signInWithCredential(facebookAuthCredential);
  }

  String? userId() => _auth.currentUser?.uid;
}
