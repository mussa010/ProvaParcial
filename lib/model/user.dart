class User {
  String name = '';
  String cpf = '';
  String mail = '';
  String password = '';

  User({required this.name, required this.cpf, required this.mail, required this.password});

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    mail = json['mail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cpf'] = cpf;
    data['mail'] = mail;
    data['password'] = password;
    return data;
  }

  String get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getMail {
    return mail;
  }

  set setMail(String mail) {
    this.mail = mail;
  }

  String get getPassword {
    return password;
  }

  set setPassword(String password) {
    this.password = password;
  }

  get getCpf {
    return cpf;
  }

  set setCpf(String cpf) {
    this.cpf = cpf;
  }
}
