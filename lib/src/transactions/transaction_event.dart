import 'package:u_finance/models/transacao_model.dart';

abstract class TransactionEvent {}

class LoadTransactionEvent extends TransactionEvent {}

class AddTransactionEvent extends TransactionEvent {
  TransacaoModel transaction;
  AddTransactionEvent({required this.transaction});
}

class RemoveTransactionEvent extends TransactionEvent {
  TransacaoModel transaction;
  RemoveTransactionEvent({required this.transaction});
}
