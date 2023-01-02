import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:u_finance/src/authentication/auth_repository.dart';
import 'package:u_finance/src/authentication/create_account/create_account_state.dart';

class CreateAccountController {
  final AuthRepository repository;
  ValueNotifier<CreateAccountState> state =
      ValueNotifier(CreateAccountStateEmpty());
  CreateAccountController({required this.repository});

  Future<void> createAccount(String name, String email, String password) async {
    try {
      state.value = CreateAccountStateLoading();

      await repository.createAccount(
          name: name, email: email, password: password);
      state.value = CreateAccountStateSuccess();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      state.value = CreateAccountStateError();
    }
  }
}
