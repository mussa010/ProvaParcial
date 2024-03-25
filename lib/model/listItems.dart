class ListItems {
  String _productName;
  int _quantity;

  ListItems(this._productName, this._quantity);

  String get productName {
    return this._productName;
  }

  set productName(String name) {
    this._productName = name;
  }

  int get qunatidadeProduto {
    return this._quantity;
  }

  set quantity(int quantity) {
    this._quantity = quantity;
  }
}
