class ListItems {
  String productName = '';
  int quantity = 0;
  bool bought = false;

  ListItems({required this.productName, required this.quantity});

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
}
