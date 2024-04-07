import 'package:flutter/material.dart';

import '../model/user.dart';

class Repository extends ChangeNotifier{

  List<User> _listUser = [];

   get getListAllUser => (_listUser);

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
}