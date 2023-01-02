import 'package:u_finance/models/transacao_model.dart';

import '../../models/despesa_model.dart';
import '../../models/receita_model.dart';

class TransactionsRepository {
  List<TransacaoModel> listarTransacoes() {
    return [
      ReceitaModel(data: DateTime.now(), valor: 100, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -70, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 50, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -23, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 20, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 30, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -80, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 100, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -70, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 50, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -23, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 20, contaId: 0),
      ReceitaModel(data: DateTime.now(), valor: 30, contaId: 0),
      DespesaModel(data: DateTime.now(), valor: -80, contaId: 0),
    ];
  }

  List<TransacaoModel> add(
      TransacaoModel transacao, List<TransacaoModel> lista) {
    lista.add(transacao);
    return lista;
  }

  List<TransacaoModel> remove(int index, List<TransacaoModel> lista) {
    lista.removeAt(index);
    return lista;
  }
}
