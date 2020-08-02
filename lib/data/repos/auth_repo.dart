import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  Future<FirebaseUser> signUp(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final FirebaseUser user = result.user;
    return user;
  }

  Future<FirebaseUser> login(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final FirebaseUser user = result.user;
    return user;
  }

  Future<FirebaseUser> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;
    return user;
  }

  Future<bool> loggedIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final result = await _auth.currentUser();
    return result != null;
  }

  Future<String> userId() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final result = await _auth.currentUser();
    return result.uid;
  }
}
