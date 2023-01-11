import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:u_finance/src/authentication/login/login_state.dart';

import '../auth_repository.dart';

class LoginController {
  final AuthRepository repository;
  ValueNotifier<LoginState> state = ValueNotifier(LoginStateEmpty());

  LoginController({required this.repository});

  Future<void> login(String email, String password) async {
    try {
      state.value = LoginStateLoading();

      await repository.login(email: email, password: password).then((value) {
        if (value != null) {
          state.value = LoginStateSuccess(user: value);
        } else {
          state.value =
              LoginStateError(errorMsg: "Usuário ou senha incorreto(a)!");
        }
      });
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
        case 'wrong-password':
          errorMsg = "Senha incorreta!";
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
      state.value = LoginStateError(errorMsg: errorMsg);
    }
  }
}
