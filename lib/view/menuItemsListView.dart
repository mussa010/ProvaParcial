import 'package:flutter/material.dart';
import 'package:prova_parcial/model/itemsList.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

import '../model/itemsList.dart';

class MenuItemListView extends StatefulWidget {
  const MenuItemListView({super.key});

  @override
  State<MenuItemListView> createState() => _MenuItemListView();
}

class _MenuItemListView extends State<MenuItemListView> {

  dialogBox(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'voltar'),
            child: const Text('voltar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String nameShoppingList = Provider.of<Repository>(context).getSelectedShoppingList().getName;
    var saveItemList = Provider.of<Repository>(context);
    List<ItemsList> listItemList = Provider.of<Repository>(context).getallItemsListShoppingList(nameShoppingList);
    if(listItemList.isEmpty) {
      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Itens da lista $nameShoppingList',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [IconButton(
            icon: const Icon(
              Icons.add_circle_sharp,
              color: Colors.white,
              size: 40,

            ),
            onPressed: () => Navigator.pushNamed(context, 't9'),
          ),],
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('Não há item cadastrado', style: TextStyle(
            color: Colors.black,
            fontSize: 20
          )
          ),
        )
      );
    }
    setState(() {
      listItemList = Provider.of<Repository>(context).getallItemsListShoppingList(nameShoppingList);
      print('tudo certo');
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Itens da lista $nameShoppingList',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [IconButton(
            icon: const Icon(
              Icons.add_circle_sharp,
              color: Colors.white,
              size: 40,

            ),
            onPressed: () => Navigator.pushNamed(context, 't9'),
          ),],
          backgroundColor: Colors.blue,
        ),
        
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
                itemCount: listItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  if(listItemList[index].bought == false) {
                    return Card(
                    color: Colors.blue,

                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListTile(
                        leading: const Icon(Icons.shopping_cart_outlined, color: Colors.white,
                          size: 40,
                        ),
                        
                        trailing: const Icon(Icons.check_circle_outline,
                        color: Colors.white),
                        onLongPress: () {
                          saveItemList.setSelectedItem(listItemList[index]);
                          Navigator.pushNamed(context, 't10').then((value) => {listItemList});
                        },
                        title: 
                          Text(listItemList[index].getProductName,
                          style: const TextStyle(color: Colors.white),),
                        subtitle: Text('Quantidade: ${listItemList[index].getProductQuantity}', 
                          style: const TextStyle(color: Colors.white)),
                      ),
                    )
                  );
                  } else {
                    return Card(
                      
                    color: Colors.blue,

                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListTile(
                        leading: const Icon(Icons.shopping_cart_outlined, color: Colors.white,
                          size: 40,
                        ),
                        
                        trailing: const Icon(Icons.check_circle_rounded,
                        color: Colors.white),
                        onLongPress: () {
                          saveItemList.setSelectedItem(listItemList[index]);
                          Navigator.pushNamed(context, 't10');
                        },
                        title: 
                          Text(listItemList[index].getProductName,
                          style: const TextStyle(color: Colors.white),),
                        subtitle: Text('Quantidade: ${listItemList[index].getProductQuantity}', 
                          style: const TextStyle(color: Colors.white)),
                      ),
                    )
                  );
                  }
                },
              )
      )
    );
  }
}
