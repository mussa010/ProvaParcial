class ShoppingList {
  String listName = '';
  String creatorName = '';

  ShoppingList({ required this.listName, required this.creatorName});

  get getName {
    return listName;
  }

  set setName(String name) {
    listName = name;
  }

  String get getCreatorName {
    return creatorName;
  }

  set setCreatorName(String cratorName) {
    creatorName = cratorName;
  }
}