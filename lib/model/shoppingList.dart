class ShoppingList {
  String listName = '';
  String creatorName = '';

  ShoppingList({ required this.listName, required this.creatorName});

  String get getName {
    return listName;
  }

  set setName(String name) {
    listName = name;
  }

  String get getCreatorName {
    return creatorName;
  }

  set setCreatorName(String cratorName) {
    this.creatorName = cratorName;
  }

  factory ShoppingList.fromJson(Map<String, dynamic> json) => ShoppingList(
    listName : json['listName'],
    creatorName : json['cratorName']
  );

  Map<String, dynamic> toJson() => {
    'listName' : listName,
    'cratorName' : creatorName
  };
}