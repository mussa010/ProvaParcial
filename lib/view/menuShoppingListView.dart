import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../database/connection.dart';
import '../model/user.dart';
import '../model/shoppingList.dart';
import '../database/shoppingListDAO.dart';
import '../database/userDAO.dart';

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
    var email = ModalRoute.of(context)!.settings.arguments;
    final emailString = email.toString();
    final shoppingList = ShoppingListDAO.getShoppingList(emailString);

    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
      padding: const EdgeInsets.all(20),
      child: FutureBuilder<List<ShoppingList?>>(
        future: shoppingList, 
        builder: ( context, AsyncSnapshot<List<ShoppingList?>> snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  ShoppingList? item = snapshot.data![index];
                  if(Connection.isConnected() == false){
                    dialogBox(context, 'Erro', 'Falha na conexão com banco de dados');
                    Navigator.pop(context,'ok');
                  }
                  else{
                    return Card(
                    child: ListTile(

                      leading: const Icon(Icons.person),
                      title: 
                        Text('Nome do criador: ${item!.getCreatorName}\nNome da lista: ${item.getName}\n'),
                      subtitle: Text('Id: ${item.getId}'),
                    )
                  );
                  }
                  return null;
                },
              );
          } else {
            return Container(
              alignment: Alignment.center,
                child: const Text('Não há lista cadastrado',
                style: TextStyle(
                  backgroundColor: Colors.blue,
                  color: Colors.white
                ),
              )
            );
          }
        }
      ), 
    )
    );
  }
}
