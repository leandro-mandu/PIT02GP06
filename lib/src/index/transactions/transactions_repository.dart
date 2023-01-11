import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/utils/collections_keys.dart';

import '../../../models/despesa_model.dart';
import '../../../models/receita_model.dart';
import '../../authentication/auth_repository_imp.dart';

class TransactionsRepository {
  final user = Modular.get<AuthRepositoryImpl>().hasUser();
  Future<List<TransactionModel>> listarTransacoes() async {
    final collections = FirebaseFirestore.instance
        .collection(CollectionsKeys.transactions)
        .where('accountId', isEqualTo: user!.uid);

    var result = await collections.get();
    List<TransactionModel> list = [];
    for (var doc in result.docs) {
      if (doc['value'] < 0) {
        list.add(DespesaModel(
          type: doc['type'],
          data: (doc['date'] as Timestamp).toDate(),
          valor: doc['value'],
          contaId: doc['accountId'],
          id: doc.id,
        ));
      } else {
        list.add(ReceitaModel(
          type: doc['type'],
          data: (doc['date'] as Timestamp).toDate(),
          valor: doc['value'],
          contaId: doc['accountId'],
          id: doc.id,
        ));
      }
    }
    return list;
  }

  Future<void> save(TransactionModel transaction) async {
    FirebaseFirestore.instance
        .collection(CollectionsKeys.transactions)
        .doc(transaction.id)
        .set({
      'accountId': user!.uid,
      'date': transaction.data,
      'type': transaction.type,
      'value': transaction.valor,
    });
  }

  void delete(String id) {
    FirebaseFirestore.instance
        .collection(CollectionsKeys.transactions)
        .doc(id)
        .delete();
  }
}
