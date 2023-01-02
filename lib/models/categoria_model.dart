// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CategoriaModel {
  int id;
  int iconId;
  String descricao;
  CategoriaModel({
    required this.id,
    required this.iconId,
    required this.descricao,
  });
}
