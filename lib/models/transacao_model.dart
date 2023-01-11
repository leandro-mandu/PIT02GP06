// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class TransactionModel {
  String? id;
  String type;
  DateTime data;
  double valor;
  String contaId;
  TransactionModel({
    this.id,
    required this.type,
    required this.data,
    required this.valor,
    required this.contaId,
  });
}
