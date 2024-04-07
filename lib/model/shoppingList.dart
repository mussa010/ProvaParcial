class ShoppingList {
  String listName = '';
  String cratorName = '';

  ShoppingList({ required this.listName, required this.cratorName});

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

  factory ShoppingList.fromJson(Map<String, dynamic> json) => ShoppingList(
    listName : json['listName'],
    cratorName : json['cratorName']
  );

  Map<String, dynamic> toJson() => {
    'listName' : listName,
    'cratorName' : cratorName
  };
}