// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:u_finance/models/transacao_model.dart';

abstract class TransactionState {
  List<TransacaoModel> transactionsList;
  TransactionState({
    required this.transactionsList,
  });
}

class InitialTransactionState extends TransactionState {
  InitialTransactionState() : super(transactionsList: []);
}

class LoadingTransactionState extends TransactionState {
  LoadingTransactionState() : super(transactionsList: []);
}

class SuccessTransactionState extends TransactionState {
  SuccessTransactionState({required super.transactionsList});
}

class ErrorTransactionState extends TransactionState {
  String message;
  ErrorTransactionState({required this.message}) : super(transactionsList: []);
}
