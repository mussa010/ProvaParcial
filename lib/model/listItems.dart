class ListItems {
  String shoppingListName = '';
  String productName = '';
  int quantity = 0;
  bool bought = false;

  ListItems({required this.productName, required this.quantity, required this.shoppingListName, required this.bought});

  String get getShoppingListname {
    return shoppingListName;
  }

  set setShoppingListName(String shoppingListName) {
    this.shoppingListName = shoppingListName;
  }

  String get getProductName {
    return productName;
  }

  set setProductName(String name) {
    productName = name;
  }

  int get getProductQuantity {
    return quantity;
  }

  set setProductQuantity(int quantity) {
    quantity = quantity;
  }

  bool get getBought {
    return bought;
  }

  set setBought(bool bought) {
    quantity = quantity;
  }

  factory ListItems.fromJson(Map<String, dynamic> json) => ListItems(
     shoppingListName : json['shoppingListName'],
     productName : json['productName'],
     quantity : json['quantity'],
     bought : json['bought']
  );

  Map<String, dynamic> toJson() => {
    'shoppingListName' : shoppingListName,
    'productName' : productName,
    'quantity' : quantity,
    'bought' : bought
  };
}