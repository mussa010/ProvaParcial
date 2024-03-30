import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  // Contrutor com acesso privado
  DB._();

  // Instancia do SQLite
  static Database? _database;

  get getDatabase async {
    if(_database != null) return _database;

    return await _initDB();
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'ListaDeCompras.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen:(db) {
      },
      // onConfigure: 
      onCreate: (Database db, int version) async{
        await db.execute(_createUserTable);
        await db.execute(_createShoppingListTable);
      }
    );
  }

  _onCreate(db, versao) async {
    await db.execute();
  }

  final String _createUserTable = '''
    CREATE TABLE User(
      id PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''';

  final String _createShoppingListTable = '''
    CREATE TABLE ShoppingList(
      id PRIMARY KEY AUTOINCREMENT,
      listName TEXT NOT NULL,
      creatorName TEXT NOT NULL
    )
    ''';

  //  String _createTable =
}