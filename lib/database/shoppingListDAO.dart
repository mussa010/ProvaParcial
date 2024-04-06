import 'package:sqflite/sqflite.dart';
import '../database/script.dart';
import '../model/shoppingList.dart';

import '../database/connection.dart';

class ShoppingListDAO  {
  static Future<int> newShoppingList(ShoppingList newShoppingList) async{
    final db = await Connection.get();
    return db.insert("ShoppingList", newShoppingList.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<ShoppingList?>> getShoppingList(String nameUser) async{
    final db = await Connection.get();

    List<Map<String, dynamic>> map = await db.query('ShoppingList', where: 'creatorName = ?', whereArgs: [nameUser]);

    return List.generate(map.length, (index) => ShoppingList.fromJson(map[index]));
  }

  static Future<int> lenghtShoppingListUser(String nameUser) async {
    final db = await Connection.get();
    List<Map<String, dynamic>> map = await db.query('ShoppingList', where: 'creatorName = ?', whereArgs: [nameUser]);
    if(map.isEmpty) {
      return 0;
    }
    List<ShoppingList> shooppingListUser= List.generate(map.length, (index) => ShoppingList.fromJson(map[index]));

    return shooppingListUser.length;
  }
}