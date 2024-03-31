import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../model/user.dart';

class DB {
  // Contrutor com acesso privado
  DB._();
  static final DB db = DB._();

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
        await db.execute(_createListItems);
      }, 
      onConfigure: (db) {
        
      },
    );
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

    final String _createListItems = '''
    CREATE TABLE ShoppingList(
      shoppingListName TEXT NOT NULL,
      productName TEXT NOT NULL, 
      quantity INTEGER,
      bought BOOLEAN
    )
    ''';

   newUser(User newUser) async {
    final db = await _database;
    var res = await db?.rawInsert(
      '''
        INSERT into User(name, email, password) VALUES 
        (${newUser.getName}, ${newUser.getEmail}, ${newUser.getPassword})
      '''
    );
    return res;
  }

  getUser(int id) async {
    final db = await _database;
    var res = await db?.query('User', where: "id = ?", whereArgs: [id]);
  }
}