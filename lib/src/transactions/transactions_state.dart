// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:u_finance/models/transacao_model.dart';

abstract class TransactionsState {}

class TransactionsStateEmpty extends TransactionsState {}

class TransactionsStateLoading extends TransactionsState {}

class TransactionsStateSuccess extends TransactionsState {
  final List<TransactionModel> transactionsList;
  TransactionsStateSuccess({
    required this.transactionsList,
  });
}

class TransactionsStateError extends TransactionsState {
  String errorMsg;
  TransactionsStateError({
    required this.errorMsg,
  });
}
