class User {
  String name = '';
  String cpf = '';
  String email = '';
  String password = '';

  User({required this.name, required this.cpf, required this.email, required this.password});

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cpf'] = cpf;
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  String get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getEmail {
    return email;
  }

  set setEmail(String email) {
    this.email = email;
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
