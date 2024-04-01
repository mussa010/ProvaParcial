import '../model/user.dart';
import 'package:sqflite/sqflite.dart';

import '../database/connection.dart';

class UserDAO {
  Database? _db;

  // Future<List<User>> getAllUser() async {
  //   _db = await Connection.get();
  //   List<Map<String,dynamic>> res = await _db!.query("user");  
  //   List<User> lista = List.generate(res.length, (i) {
  //     var linha = res[i];
  //     return User(
  //       id: linha['id'],
  //       name:linha['name'],
  //       email: linha['email'],
  //       password: linha['password']
  //     );
  //   }
  //   );
  //   return lista;
  //   }

  dropTableUser() async {
    _db = await instance.;
    var res = await _db!.delete("User");
    return res;
  }

  Future<int> newuser(User newUser) async {
    
    _db!.insert(table, values)
  }

  getUser(int id) async {
    _db = await ;

    var res = await _db!.query("User", where: "id = ?", whereArgs: [id]);

    return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }

  Future<List<User>> getAllUsers() async {
    _db = await Connection.get();

    var res = await _db!.query("User");
    List<User> lista = res.isNotEmpty ? res.map((u) => User.fromMap(u)).toList() : [];

    return lista;
  }
}