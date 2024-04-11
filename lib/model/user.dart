class User {
  String name = '';
  String email = '';
  String password = '';

  User({required this.name, required this.email, required this.password});

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
}