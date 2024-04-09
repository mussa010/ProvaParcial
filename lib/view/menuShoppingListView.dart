import 'package:flutter/material.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

import '../model/shoppingList.dart';

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
    var saveShoppingListName = Provider.of<Repository>(context);
    List<ShoppingList> listShoppingList = Provider.of<Repository>(context).getListAllShoppingListUser();
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
          child: const Text('Não há lista cadastrada', style: TextStyle(
            color: Colors.black,
            fontSize: 20
          )
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
                    color: Colors.blue,

                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListTile(
                        leading: const Icon(Icons.list, color: Colors.white,
                          size: 40,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                        onTap: () {
                          // saveShoppingListName.setShoppingListName();
                          Navigator.pushNamed(context, 't8');
                        },
                        title: 
                          Text(listShoppingList[index].getName,
                          style: const TextStyle(color: Colors.white),),
                      ),
                    )
                  );
                  
                },
              )
      )
    );
  }
}
