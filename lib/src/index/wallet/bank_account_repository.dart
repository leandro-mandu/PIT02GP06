import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_finance/models/bank_account_model.dart';
import 'package:u_finance/models/transacao_model.dart';
import 'package:u_finance/utils/collections_keys.dart';

import '../../authentication/auth_repository_imp.dart';

class BankAccountRepository {
  final user = Modular.get<AuthRepositoryImpl>().hasUser();
  Future<List<BankAccountModel>> listar() async {
    final collections = FirebaseFirestore.instance
        .collection(CollectionsKeys.bankAccounts)
        .where('uid', isEqualTo: user!.uid);

    var result = await collections.get();
    List<BankAccountModel> list = [];
    for (var doc in result.docs) {
      list.add(BankAccountModel(
          id: doc.id,
          uid: doc['uid'],
          nome: doc['name'],
          saldo: doc['balance']));
    }
    return list;
  }

  Future<void> save(BankAccountModel bankAccountModel) async {
    FirebaseFirestore.instance
        .collection(CollectionsKeys.bankAccounts)
        .doc(bankAccountModel.id)
        .set({
      'uid': bankAccountModel.uid,
      'name': bankAccountModel.nome,
      'balance': bankAccountModel.saldo,
    });
  }

  void delete(String id) {
    FirebaseFirestore.instance
        .collection(CollectionsKeys.bankAccounts)
        .doc(id)
        .delete();
  }
}
