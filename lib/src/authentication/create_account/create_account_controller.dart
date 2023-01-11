import 'package:firebase_auth/firebase_auth.dart';
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
      String errorMsg;
      String code = "";
      if (e.runtimeType == FirebaseAuthException) {
        code = (e as FirebaseAuthException).code;
      }
      switch (code) {
        case 'unknown':
          errorMsg = "Usuário ou senha vazio(a)!";
          break;

        case 'weak-password':
          errorMsg = "Senha muito curta! É preciso ao menos 6 caracteres.";
          break;
        case 'wrong-password':
          errorMsg = "Senha incorreta!";
          break;

        case 'invalid-email':
          errorMsg = "Formato de e-mail incorreto!";
          break;
        case 'user-not-found':
          errorMsg = "Usuário não encontrado!";
          break;

        case 'network-request-failed':
          errorMsg = "Sem conexão de internet!";
          break;
        default:
          errorMsg = "Erro desconhecido! por favor tente novamente.";
      }
      state.value = CreateAccountStateError(errorMsg: errorMsg);
    }
  }
}
