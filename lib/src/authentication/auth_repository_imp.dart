import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:u_finance/src/authentication/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    var credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (credential.runtimeType == UserCredential) {
      await credential.user!.updateDisplayName(name);
    }
  }

  @override
  User? hasUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<FirebaseApp> init() async {
    return await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDgaioRf5kJMTKbCk5oHfYBF2tma3ajPBc",
      appId: "1:620772781390:android:db4a37f7ab0791c862421f",
      messagingSenderId: "620772781390",
      projectId: "u-finance-f837c",
    ));
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  @override
  Future<void> recoveryPassword({required String email}) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
