class User {
  String _nome;
  String _email;
  String _senha;
  User(this._email, this._nome, this._senha);
  String get nome => _nome;
  String get email => _email;
  bool testSenha(String senha) {
    if (senha == _senha) {
      return true;
    }
    return false;
  }

  void set nome(String nome) {
    _nome = nome;
  }

  void set email(String email) {
    _email = email;
  }

  void set senha(String senha) {
    _senha = senha;
  }
}
