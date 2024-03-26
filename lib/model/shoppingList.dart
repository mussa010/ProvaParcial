import "./listItems.dart";

class ShoppingList {
  String listName = '';
  String cratorName = '';
  List<ListItems> shoppingList = [];

  ShoppingList({required this.listName});

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
}
