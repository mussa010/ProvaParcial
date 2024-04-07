
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

import '../model/shoppingList.dart';
import '../model/user.dart';

class MenuShoppingListView extends StatefulWidget {
  const MenuShoppingListView({super.key});

  @override
  State<MenuShoppingListView> createState() => _MenuShoppingListView();
}

class _MenuShoppingListView extends State<MenuShoppingListView> {

  dialogBox(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 't1'),
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ShoppingList> listShoppingList = Provider.of<Repository>(context).getlistAllShoppingListUser();
    if(listShoppingList.isEmpty) {
      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Listas de compra',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 40,

            ),
            onPressed: () => Navigator.pushNamed(context, 't7'),
          ),],
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text('Não há usuário cadastrado', style: TextStyle(
            color: Colors.white, 
            backgroundColor: Colors.blue)
          ),
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Listas de compra',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 40,

            ),
            onPressed: () => Navigator.pushNamed(context, 't7'),
          ),],
          backgroundColor: Colors.blue,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
                itemCount: listShoppingList.length,
                itemBuilder: (BuildContext context, int index) {
                    return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: 
                        Text('Nome: ${listShoppingList[index].getName}\nEmail: ${listShoppingList[index].getCreatorName}'),
                      subtitle: const Text('Deu certo'),
                    )
                  );
                  
                },
              )
      )
    );
  }
}

