class User {
  String name = '';
  int? id;
  String email = '';
  String password = '';

  User({required this.name, required this.email, required this.password, this.id});

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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password']
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'password' : password
  };
}
