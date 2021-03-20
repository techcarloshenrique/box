class DummyList {
  String id;
  String nome;
  String email;
  String avatar;

  DummyList();

  set setId(String value) {
    this.id = value;
  }

  String get getId {
    return this.id;
  }

  set setNome(String value) {
    this.nome = value;
  }

  String get getNome {
    return this.nome;
  }

  set setEmail(String value) {
    this.email = value;
  }

  String get getEmail {
    return this.email;
  }

  set setAvatar(String value) {
    this.avatar = value;
  }

  String get getAvatar {
    return this.avatar;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'avatar': avatar,
    };
  }

  DummyList.fromMap(Map<String, dynamic> map) {
    id = map['site'];
    nome = map['nome'];
    email = map['email'];
    avatar = map['avatar'];
  }
}
