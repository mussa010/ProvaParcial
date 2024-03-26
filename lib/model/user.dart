class User {
  String name;
  String cpf;
  String mail;
  String password;

  User({required this.name, required this.cpf, required this.mail, required this.password});

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['password'] = this.password;
    return data;
  }

  String get getName {
    return this.name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getMail {
    return this.mail;
  }

  set setMail(String mail) {
    this.mail = mail;
  }

  String get getPassword {
    return this.password;
  }

  set setPassword(String password) {
    this.password = password;
  }
}
