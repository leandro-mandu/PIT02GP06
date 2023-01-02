import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  User user;
  HomeStateSuccess({
    required this.user,
  });
}

class HomeStateError extends HomeState {}
