import 'package:flutter/material.dart';
import 'package:prova_parcial/model/itemsList.dart';

import '../model/user.dart';
import '../model/shoppingList.dart';
import '../model/itemsList.dart';

class Repository extends ChangeNotifier{
  final List<User> _listUser = [];
  final List<ShoppingList> _listShoppingList = [];
  final List<ItemsList> _listItemsList= [];
  String userName = '';
  String shoppingListName = '';

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

  // Criar lista de um usuário específico  
  saveShoppingListUser(ShoppingList sh) {
    if(! _listShoppingList.contains(sh)) {
      _listShoppingList.add(sh);
    }
    notifyListeners();
  } 

  //Pegar nome da lista de compra atual
  get getnameShoppingList => (shoppingListName);

  //Salvar item na lista de compras global 
  saveItemList(ItemsList it) {
    if(! _listItemsList.contains(it)) {
      _listItemsList.add(it);
    }

    notifyListeners();
  }

  //Pegar todos os itens de uma lista de compras específica
  List<ItemsList> getallItemsListShoppingList(String nameShoppingList) {
    List<ItemsList> it = [];
    for(ItemsList item in _listItemsList) {
      if(item.getShoppingListname == nameShoppingList) {
        it.add(item);
      }
    }
    return it;
  }

  editItemBought(ItemsList it) {
    for(ItemsList i in _listItemsList) {
      if(i.getProductName == it.getProductName && i.getShoppingListname == it.getShoppingListname) {
        i.setProductName = it.getProductName;
        i.setProductQuantity = it.getProductQuantity;
        i.setBought = i.getBought;
      }
    }
  } 
}