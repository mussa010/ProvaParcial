import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:prova_parcial/model/itemsList.dart';
import 'package:prova_parcial/view/editShoppingListView.dart';

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

  editShoppingList(ShoppingList sh) {
    for(ShoppingList s in _listShoppingList) {
      if(sh.getCreatorName == s.getCreatorName && sh.getName == s.getName) {
        s.setCreatorName = sh.getCreatorName;
        s.setName = sh.getName;
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

  // Salvar item na lista de compras global 
  saveItemList(ItemsList it) {
    if (!_listItemsList.contains(it)) {
      _listItemsList.add(it);
    }
    notifyListeners();
  }

  // Editar item da lista
  editItem(ItemsList it) {
    for (ItemsList i in _listItemsList) {
      if (i.getProductName == selectedItem.getProductName && i.getShoppingListname == selectedItem.getShoppingListname) {
        _listItemsList.remove(i);
        notifyListeners();
        _listItemsList.add(it);
        notifyListeners();
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
}