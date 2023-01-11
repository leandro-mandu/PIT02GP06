import 'package:u_finance/models/transacao_model.dart';

class DespesaModel extends TransactionModel {
  DespesaModel(
      {required super.data,
      required super.valor,
      required super.contaId,
      required super.type,
      super.id});
}
