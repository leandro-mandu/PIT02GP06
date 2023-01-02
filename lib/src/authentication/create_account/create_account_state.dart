import '../../../models/user_model.dart';

abstract class CreateAccountState {}

class CreateAccountStateEmpty extends CreateAccountState {}

class CreateAccountStateLoading extends CreateAccountState {}

class CreateAccountStateSuccess extends CreateAccountState {}

class CreateAccountStateError extends CreateAccountState {}
