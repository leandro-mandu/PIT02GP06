// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class TransacaoModel {
  DateTime data;
  double valor;
  int contaId;
  TransacaoModel({
    required this.data,
    required this.valor,
    required this.contaId,
  });
}
