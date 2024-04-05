import '../model/listItems.dart';
import 'package:sqflite/sqflite.dart';
import '../database/script.dart';

import '../database/connection.dart';

class ListItemsDAO {

  static Future<int> newListItems(ListItems newListItems) async {
    final db = await Connection.get();
    return db.insert("ListItems", newListItems.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<ListItems?> getListItems(String shoppingListName) async{
    final db = await Connection.get();

    List<Map<String, dynamic>> map = await db.query("ListItems", where: "shoppingListName = ?", whereArgs: [shoppingListName]);
    if(map.isEmpty) {
      return null;
    }
    return ListItems.fromJson(map[0]);
  }



}
