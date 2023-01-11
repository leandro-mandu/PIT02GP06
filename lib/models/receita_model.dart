import 'package:u_finance/models/transacao_model.dart';

class ReceitaModel extends TransactionModel {
  ReceitaModel(
      {required super.data,
      required super.valor,
      required super.contaId,
      required super.type,
      super.id});
}
