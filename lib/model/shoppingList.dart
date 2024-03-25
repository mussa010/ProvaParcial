import "./listItems.dart";

class ShoppingList {
  String listName = '';
  List<ListItems> shoppingList = [];

  ShoppingList({required this.listName});

  String get getName {
    return this.listName;
  }

  set setName(String name) {
    this.listName = name;
  }
}
