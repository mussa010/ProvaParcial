import 'package:flutter/material.dart';
import 'package:prova_parcial/model/itemsList.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

import '../model/shoppingList.dart';

class SearchShoppingByItem extends StatefulWidget {
  const SearchShoppingByItem ({super.key});

  @override
  State<SearchShoppingByItem> createState() => _SearchShoppingByItem();
}

class _SearchShoppingByItem extends State<SearchShoppingByItem> {
  var txtItemName= TextEditingController();
  List<ShoppingList> _filteredShoppingLists = [];
  String nameItem = '';

  @override
  Widget build(BuildContext context) {
    var save = Provider.of<Repository>(context);

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Listas de compra',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              if(txtItemName.text.isEmpty) {
                dialogBox(context, 'Aviso', 'Campo de pesquisa está vazio');
              } else {
                setState(() {
                  _filteredShoppingLists = save.returnShoppingListFromItemSearch(txtItemName.text);
                });
              }
            }
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                TextField(
                  controller: txtItemName,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          txtItemName.clear();
                         _filteredShoppingLists.clear();
                        });

                      },
                    ),
                  ),
                ),],)
          ),
          Expanded(
            child: _filteredShoppingLists.isEmpty
                ? const Center(
                    child: Text(
                      'Não há lista com o item pesquisado',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredShoppingLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.blue,
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: ListTile(
                            leading: const Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 40,
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onTap: () {
                              save.setSelectedShoppingList(
                                  _filteredShoppingLists[index]);
                              Navigator.pushNamed(context, 't8');
                            },
                            title: Text(
                              _filteredShoppingLists[index].getName,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
