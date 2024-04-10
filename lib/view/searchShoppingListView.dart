import 'package:flutter/material.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

import '../model/shoppingList.dart';

class SearchShoppingByItem extends StatefulWidget {
  const SearchShoppingByItem ({super.key});

  @override
  State<SearchShoppingByItem> createState() => _SearchShoppingByItem();
}

class _SearchShoppingByItem extends State<SearchShoppingByItem> {
  final TextEditingController _searchController = TextEditingController();
  List<ShoppingList> _filteredShoppingLists = [];

  @override
  void initState() {
    super.initState();
    _filteredShoppingLists = [];
  }

  @override
  Widget build(BuildContext context) {
    var save = Provider.of<Repository>(context);
    List<ShoppingList> listShoppingList =
        Provider.of<Repository>(context).getListAllShoppingListUser();

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => Navigator.pushNamed(context, 't7'),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _filteredShoppingLists = [];
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _filteredShoppingLists = listShoppingList
                      .where((list) => list.getName
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: _filteredShoppingLists.isEmpty
                ? const Center(
                    child: Text(
                      'Não há lista cadastrada',
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
                            onLongPress: () {
                              save.setSelectedShoppingList(
                                  _filteredShoppingLists[index]);
                              Navigator.pushNamed(context, 't11');
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
