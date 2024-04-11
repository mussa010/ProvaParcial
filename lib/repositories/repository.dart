import 'package:flutter/material.dart';

import '../model/user.dart';
import '../model/shoppingList.dart';
import '../model/itemsList.dart';

class Repository extends ChangeNotifier{
  final List<User> _listUser = [];
  final List<ShoppingList> _listShoppingList = [];
  final List<ItemsList> _listItemsList= [];
  String userName = '';
  String shoppingListName = '';
  String itemName = '';

  ShoppingList selectedShoppingList = ShoppingList(listName: '', creatorName: '');
  ItemsList selectedItem = ItemsList(productName: '', quantity: 0, shoppingListName: '', bought: false);

  // Pega toda a lista de usuário
  get getListAllUser => (_listUser);

  //Pega o nome atual do usuário
  get getUsername => (userName);
    
  // Salva nome do usuário atual 
  setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  //Salvar lista de usuários pré-definido
  saveAll(List<User> user) {
    for (User u in user) { 
      if(! _listUser.contains(u)) {
        _listUser.add(u);
      }
    }
    notifyListeners();
  }

  // Salvar nome do usuário atual
  saveUser(User user) {
    if(! _listUser.contains(user)) {
      _listUser.add(user);
    }
    notifyListeners();
  } 

  // pega todas as listas de compra
  get getListAllShoppingList => (_listShoppingList);

  // Pegar todas as listas de compra de um usuário específico
  List<ShoppingList>getListAllShoppingListUser() {
    List<ShoppingList> sh = [];
    for(ShoppingList s in _listShoppingList) {
      if(s.getCreatorName == userName) {
        sh.add(s);
      }
    }
    return sh;
  }

  // Salvar nome da lista de compra selecionada pelo usuário
  setShoppingListName(String name) {
    shoppingListName = name;
    notifyListeners();
  }

  // Alterações do nome da lista e atualização do nome da lista guardado na classe ItemList
  editShoppingList(ShoppingList sh) {
  for (int i = 0; i < _listItemsList.length; i++) {
    if (_listItemsList[i].getShoppingListname == getSelectedShoppingList().getName) {
      _listItemsList[i].setShoppingListName = sh.getName;
    }
  }

  for (int i = 0; i < _listShoppingList.length; i++) {
    if (sh.getCreatorName == _listShoppingList[i].getCreatorName && sh.getName == _listShoppingList[i].getName) {
      _listShoppingList[i].setCreatorName = sh.getCreatorName;
      _listShoppingList[i].setName = sh.getName;
    }
  }
  notifyListeners();
}

  // Criar lista de um usuário específico  
  saveShoppingListUser(ShoppingList sh) {
    if(! _listShoppingList.contains(sh)) {
      _listShoppingList.add(sh);
    }
    notifyListeners();
  } 

  //Guarda lista selecionada
  setSelectedShoppingList(ShoppingList sh) {
    selectedShoppingList = sh;
    notifyListeners();
  }

  removeShoppingList(ShoppingList sh) {
    for(ItemsList i in _listItemsList) {
      if(i.getShoppingListname == sh.getName) {
           _listItemsList.remove(i);
      }
    }
    _listShoppingList.remove(sh);
    notifyListeners();
  }

  // Salvar item na lista de compras global 
  saveItemList(ItemsList it) {
    if (!_listItemsList.contains(it)) {
      _listItemsList.add(it);
    }
    notifyListeners();
  }

  // Editar item da lista
  editItem(ItemsList it) {
    for (int i = 0; i < _listItemsList.length; i++) {
      if (_listItemsList[i].getProductName == selectedItem.getProductName && _listItemsList[i].getShoppingListname == selectedItem.getShoppingListname) {
        _listItemsList[i].setBought = it.getBought;
        _listItemsList[i].setProductName = it.getProductName;
        _listItemsList[i].setProductQuantity = it.getProductQuantity;
      }
    }
    notifyListeners();
  }

  // Retorna lista de compras selecionada
  ShoppingList getSelectedShoppingList() {
    return selectedShoppingList;
  }

  // Remover item da lista
  removeItem(ItemsList it) {
    _listItemsList.remove(it);
    notifyListeners();
  }

  // Salvar nome item selecionado
  setSelectedItemName(String name) {
    itemName = name;
    notifyListeners();
  }

  // Salva item selecionado
  setSelectedItem (ItemsList it){
    selectedItem = it;
  }

  // Retorna item selecionado
  ItemsList getSelectedItem() {
    return selectedItem;
  }

  // Retorna lista de itens de um ShoppingList
  List<ItemsList>getItemsFromShoppingList(String sh) {
    List<ItemsList> it = [];
    for(ItemsList i in _listItemsList) {
      if(i.getShoppingListname == sh) {
        it.add(i);
      }
    }
    return it;

  }

  //Remover itens especificos da lista
  removeItensFromShoppingList(List<ItemsList> li) {
    for(ItemsList i in _listItemsList) {
      for(ItemsList item in li) {
        if(item.getProductName == i.getProductName && item.getShoppingListname == i.getShoppingListname) {
          _listItemsList.remove(item);
        }
      }
    }
    notifyListeners();
  }

  // Retorna lista de ShoppingList que possua o item que o usuário quer pesquisar

  List<ShoppingList> returnShoppingListFromItemSearch(String itemName) {
    List<ShoppingList> sh = [];
    for(ItemsList i in _listItemsList) {
      if(i.getProductName.toLowerCase() == itemName.toLowerCase()) {
        for(ShoppingList s in _listShoppingList) {
          if(s.getName.toLowerCase() == i.getShoppingListname.toLowerCase() && s.getCreatorName.toLowerCase() == userName.toLowerCase()) {
            sh.add(s);
          }
        }
      }
    }
    return sh;
  }
}