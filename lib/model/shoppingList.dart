import "./listItems.dart";

class ShoppingList {
  String listName = '';
  String cratorName = '';
  List<ListItems> shoppingList = [];

  ShoppingList({required this.listName});

  String get getName {
    return this.listName;
  }

  set setName(String name) {
    this.listName = name;
  }

  String get getCreatorName {
    return this.cratorName;
  }

  set setCreatorName(String cratorName) {
    this.cratorName = cratorName;
  }
}
