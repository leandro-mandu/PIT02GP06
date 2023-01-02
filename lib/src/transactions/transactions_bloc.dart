import 'package:bloc/bloc.dart';
import 'package:u_finance/src/transactions/transaction_event.dart';
import 'package:u_finance/src/transactions/transaction_state.dart';
import 'package:u_finance/src/transactions/transactions_repository.dart';

class TransactionsBloc extends Bloc {
  final _repository = TransactionsRepository();

  TransactionsBloc() : super(InitialTransactionState()) {
    on<LoadTransactionEvent>(
      (event, emit) => emit(SuccessTransactionState(
          transactionsList: _repository.listarTransacoes())),
    );
    on<AddTransactionEvent>(
      (event, emit) => emit(SuccessTransactionState(
          transactionsList: _repository.add(event.transaction, []))),
    );
  }
}
