// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashState {}

class SplashStateLoading extends SplashState {}

class SplashStateAuthenticated extends SplashState {
  User user;
  SplashStateAuthenticated({
    required this.user,
  });
}

class SplashStateUnauthenticated extends SplashState {}

class SplashStateError extends SplashState {}
