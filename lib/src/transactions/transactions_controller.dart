import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/src/transactions/transactions_state.dart';
import 'package:u_finance/src/transactions/transactions_repository.dart';

class TransactionsController {
  final _repository = Modular.get<TransactionsRepository>();

  ValueNotifier<TransactionsState> state =
      ValueNotifier(TransactionsStateEmpty());

  TransactionsController() {
    init();
  }

  void init() async {
    state.value = TransactionsStateLoading();
    final List<TransactionModel> transactionsList =
        await _repository.listarTransacoes();
    state.value = TransactionsStateSuccess(transactionsList: transactionsList);
  }

  void saveTransaction(TransactionModel transaction) async {
    state.value = TransactionsStateLoading();
    await _repository.save(transaction);
    final List<TransactionModel> transactionsList =
        await _repository.listarTransacoes();
    state.value = TransactionsStateSuccess(transactionsList: transactionsList);
  }

  void delete(String id) async {
    _repository.delete(id);
    final List<TransactionModel> transactionsList =
        await _repository.listarTransacoes();
    state.value = TransactionsStateSuccess(transactionsList: transactionsList);
  }
}
