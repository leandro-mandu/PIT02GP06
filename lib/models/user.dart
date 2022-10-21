// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String nome;
  String email;
  String senha;
  User(
    this.nome,
    this.email,
    this.senha,
  );

  User copyWith({
    String? nome,
    String? email,
    String? senha,
  }) {
    return User(
      nome ?? this.nome,
      email ?? this.email,
      senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['nome'] as String,
      map['email'] as String,
      map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(nome: $nome, email: $email, senha: $senha)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.email == email && other.senha == senha;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ senha.hashCode;
}
