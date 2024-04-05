import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../database/script.dart';


class Connection {

  Connection._();

  // Inicialização banco de dados
  static Future<Database> get() async {
    Database db;
      var path = join(await getDatabasesPath(), 'ListaDeCompras.db');
        db = await openDatabase(
        path,
        version: 1,
        onCreate: (db ,version) async{
          await db.execute(createUserTable);
          await db.execute(createShoppingListTable);
          await db.execute(createListItems);
          await db.execute(creatAdminUser);
        }, 
        onConfigure: (db) async {
            await db.execute('PRAGMA foreign_keys = ON');
        },
      );
    return db;
  } 

  static Future<bool> isConnected() async{
    final db = await get();
    if(db.isOpen) {
      return false;
    }
    return true;
  } 
}