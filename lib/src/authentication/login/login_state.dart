// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_model.dart';

abstract class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  User user;
  LoginStateSuccess({
    required this.user,
  });
}

class LoginStateError extends LoginState {
  String errorMsg;
  LoginStateError({
    required this.errorMsg,
  });
}
