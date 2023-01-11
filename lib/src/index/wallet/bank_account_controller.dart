import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/src/index/wallet/bank_account_repository.dart';
import 'package:u_finance/src/index/transactions/transactions_state.dart';
import 'package:u_finance/src/index/transactions/transactions_repository.dart';

import '../../../models/bank_account_model.dart';
import 'bank_account_state.dart';

class BankAccountController {
  final _repository = Modular.get<BankAccountRepository>();

  ValueNotifier<BankAccountState> state =
      ValueNotifier(BankAccountStateEmpty());

  BankAccountController() {
    init();
  }

  void init() async {
    state.value = BankAccountStateLoading();
    final List<BankAccountModel> list = await _repository.listar();
    state.value = BankAccountStateSuccess(list: list);
  }

  void save(BankAccountModel model) async {
    state.value = BankAccountStateLoading();
    await _repository.save(model);
    final List<BankAccountModel> list = await _repository.listar();
    state.value = BankAccountStateSuccess(list: list);
  }

  void delete(String id) async {
    _repository.delete(id);
    final List<BankAccountModel> list = await _repository.listar();
    state.value = BankAccountStateSuccess(list: list);
  }
}
