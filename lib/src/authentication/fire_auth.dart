import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
