class ShoppingList {
  int id = 0;
  String listName = '';
  String cratorName = '';

  ShoppingList({required this.listName, required this.cratorName});

  String get getName {
    return listName;
  }

  set setName(String name) {
    listName = name;
  }

  String get getCreatorName {
    return cratorName;
  }

  set setCreatorName(String cratorName) {
    this.cratorName = cratorName;
  }

  set setId(int id) {
    this.id = id;
  }

  get getId {
    return id;
  }
}
