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

  get getListAllUser => (_listUser);

  get getUsername => (userName);
    
  setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  setShoppingListName(String name) {
    shoppingListName = name;
    notifyListeners();
  }

  saveAll(List<User> user) {
    for (User u in user) { 
      if(! _listUser.contains(u)) {
        _listUser.add(u);
      }
    }
    notifyListeners();
  }

  saveUser(User user) {
    if(! _listUser.contains(user)) {
      _listUser.add(user);
    }
    notifyListeners();
  } 

  get getlistAllShoppingList => (_listShoppingList);

  List<ShoppingList>getlistAllShoppingListUser() {
    List<ShoppingList> sh = [];
    for(ShoppingList s in _listShoppingList) {
      if(s.getCreatorName == userName) {
        sh.add(s);
      }
    }
    return sh;
  }

  saveShoppingListUser(ShoppingList sh) {
    if(! _listShoppingList.contains(sh)) {
      _listShoppingList.add(sh);
    }
    notifyListeners();
  } 

  get getnameShoppingList => (shoppingListName);

  saveItemList(ItemsList it) {
    if(! _listItemsList.contains(it)) {
      _listItemsList.add(it);
    }

    notifyListeners();
  }
}