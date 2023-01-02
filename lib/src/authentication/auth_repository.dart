import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> init();
  Future<void> createAccount(
      {required String name, required String email, required String password});
  Future<User?> login({required String email, required String password});
  Future<void> recoveryPassword({required String email});
  User? hasUser();
  Future<void> signOut();
}
