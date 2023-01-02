// ignore_for_file: public_member_api_docs, sort_constructors_first
class ContaModel {
  int id;
  int userId;
  String nome;
  double saldo = 0.0;
  ContaModel({
    required this.id,
    required this.userId,
    required this.nome,
    required this.saldo,
  });
}
