import 'dart:convert';

class ShoppingList {
  int id = 0;
  String listName = '';
  String cratorName = '';

  ShoppingList({required this.id, required this.listName, required this.cratorName});

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

  factory ShoppingList.fromMap(Map<String, dynamic> json) => ShoppingList(
    id : json["id"],
    listName : json["lisName"],
    cratorName : json["cratorName"]
  );

  ShoppingList shoppingListFromJson(String str) {
    final jsonData = json.decode(str);
    return ShoppingList.fromMap(jsonData);
  }

  Map<String, dynamic> toMap() => {
    "id" : id,
    "listName" : listName,
    "cratorName" : cratorName
  };

  String shoppingListToJson (ShoppingList data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }
}