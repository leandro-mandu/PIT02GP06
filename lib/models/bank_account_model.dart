// ignore_for_file: public_member_api_docs, sort_constructors_first
class BankAccountModel {
  String? id;
  String uid;
  String nome;
  double saldo = 0.0;
  BankAccountModel({
    this.id,
    required this.uid,
    required this.nome,
    required this.saldo,
  });
}
