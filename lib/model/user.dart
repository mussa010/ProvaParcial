class User {
  String name = '';
  int id = 0;
  String email = '';
  String password = '';

  User({required this.name, required this.id, required this.email, required this.password});

  fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
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

  get getId {
    return id;
  }

  set setId (int id) {
    this.id = id;
  }
}
