import 'package:flutter/material.dart';
import 'package:prova_parcial/model/itemsList.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

class MenuItemListView extends StatelessWidget {
  const MenuItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final save = Provider.of<Repository>(context);
    final nameShoppingList = save.getSelectedShoppingList().getName;
    List<ItemsList> listItems = Provider.of<Repository>(context).getItemsFromShoppingList(nameShoppingList);

    String status = '';
    if(listItems.isEmpty) {
      return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Listas de itens',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
          child: const Text('Não há itens cadastrado', style: TextStyle(
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
            'Listas de itens',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
                itemCount: listItems.length,
                itemBuilder: (BuildContext context, int index) {
                   if(listItems[index].getBought == true) {
                      status = 'Comprado';
                    } else {
                      status = 'Não comprado';
                    }
                    return Card(
                    color: Colors.blue,
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListTile(
                        leading: const Icon(Icons.list, color: Colors.white,
                          size: 40,
                        ),
                        onTap: () {
                          save.setSelectedItem(listItems[index]);
                          Navigator.pushNamed(context, 't10');
                        },
                        title: 
                          Text('Nome: ${listItems[index].getProductName}\nQuantidade: ${listItems[index].getProductQuantity}\nStatus: $status',
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
