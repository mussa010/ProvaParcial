import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../database/script.dart';


class Connection {

  Connection._();
  

  // Instancia do SQLite
  static Database? _db;

  // Inicialização banco de dados
  static Future<Database?> get() async {
    if(_db == null) {
      var path = join(await getDatabasesPath(), 'ListaDeCompras.db');
        _db = await openDatabase(
        path,
        version: 1,
        // onConfigure: 
        onCreate: (db ,version) async{
          await db.execute(createUserTable);
          await db.execute(createShoppingListTable);
          await db.execute(createListItems);
        }, 
        onConfigure: (db) {
          
        },
      );
    }
    return _db;
  } 

  static Future<bool> isConnected() async{
    _db = await get();
    return _db!.isOpen;
  } 
}