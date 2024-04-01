import '../model/user.dart';
import 'package:sqflite/sqflite.dart';

import '../database/connection.dart';

class UserDAO {

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
    final db = await Connection.get();
    var res = await db!.delete("User");
    return res;
  }

  static Future<int> newUser(User newUser) async {
    final db = await Connection.get();
    return db!.insert("User", newUser.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<User?> getUser(String email) async {
    final db = await Connection.get();

    List<Map<String, dynamic>> map = await db!.query("User", where: "email = ?", whereArgs: [email]);
    if(map.isEmpty) {
      return null;
    }
    return User.fromJson(map[0]);
    
  }

  Future<List<User>> getAllUsers() async {
    final db = await Connection.get();

    final List<Map<String, dynamic>> map = await db!.query("User");

    return List.generate(map.length, (index) => User.fromJson(map[index]));
  }
}