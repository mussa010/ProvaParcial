class ListItems {
  String _productName = '';
  int _quantity = 0;

  ListItems(this._productName, this._quantity);

  String get productName {
    return _productName;
  }

  set productName(String name) {
    _productName = name;
  }

  int get qunatidadeProduto {
    return _quantity;
  }

  set quantity(int quantity) {
    _quantity = quantity;
  }
}
