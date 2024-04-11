class ItemsList {
  String shoppingListName = '';
  String productName = '';
  int quantity = 0;
  bool bought = false;

  ItemsList({required this.productName, required this.quantity, required this.shoppingListName, required this.bought});

  String get getShoppingListname {
    return shoppingListName;
  }

  set setShoppingListName(String name) {
    shoppingListName = name;
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

  set setBought(bool b) {
    bought = b;
  }

  get getProductQuantityString {
    return quantity.toString();
  }

  set setProductQuantityToInt(String q) {
    quantity = int.parse(q);
  }
}