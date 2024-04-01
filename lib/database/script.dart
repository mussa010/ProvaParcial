// Criação da tabela de usuário
  const String createUserTable = '''
    CREATE TABLE User(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''';

  // Criação da tabela da lista de compras
  const String createShoppingListTable = '''
    CREATE TABLE ShoppingList(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      listName TEXT NOT NULL,
      creatorName TEXT NOT NULL
    )
    ''';


  // Criação da tabela de itens
  const String createListItems = '''
    CREATE TABLE ListItems(
      shoppingListName TEXT NOT NULL,
      productName TEXT NOT NULL, 
      quantity INTEGER,
      bought BOOLEAN
    )
    ''';