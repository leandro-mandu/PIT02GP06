// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:u_finance/models/transacao_model.dart';

import '../../../models/bank_account_model.dart';

abstract class BankAccountState {}

class BankAccountStateEmpty extends BankAccountState {}

class BankAccountStateLoading extends BankAccountState {}

class BankAccountStateSuccess extends BankAccountState {
  final List<BankAccountModel> list;
  BankAccountStateSuccess({
    required this.list,
  });
}

class BankAccountStateError extends BankAccountState {
  String errorMsg;
  BankAccountStateError({
    required this.errorMsg,
  });
}
