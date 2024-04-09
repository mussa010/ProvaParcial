// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../repositories/repository.dart';
import 'package:provider/provider.dart';
import '../model/itemsList.dart';

class CreatItemList extends StatefulWidget {
  const CreatItemList({super.key});

  @override
  State<CreatItemList> createState() => _CreatShoppingList();
}

class _CreatShoppingList extends State<CreatItemList> {
  //chave formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //controlador para campo de texto
  var txtItemName = TextEditingController();
  var txtQuantity = TextEditingController();

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
    String shoppingListName = Provider.of<Repository>(context).getnameShoppingList;
    final save = Provider.of<Repository>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:  Text(
            shoppingListName,
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
              Icons.save,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              if(txtItemName.text.isEmpty || txtQuantity.text.isEmpty) {
                dialogBox(context, 'Erro', 'Campo vazio');
              } else {
                ItemsList it = ItemsList(productName: txtItemName.text, shoppingListName: shoppingListName, quantity:int.parse(txtQuantity.text), bought: false);
                save.saveItemList(it);
                setState(() {
                  txtItemName.clear();
                  txtQuantity.clear();
                });
                dialogBox(context, 'Lista de compras', 'Lista criada com sucesso');
              }
            }
          ),],
          backgroundColor: Colors.blue,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Campo de nome do item
              TextFormField(
                keyboardType: TextInputType.text,
                      controller: txtItemName,
                      decoration: const InputDecoration(
                        labelText: 'Informe o nome do item',
                      ),
                          // Validar se campo está vazio
                      validator: (value) {
                        if (value == null) {
                          return 'Campo vazio';
                        } else if (value.isEmpty) {
                          return 'Campo vazio';
                        }
                        return null;
                      },

              ),
              TextFormField(
                keyboardType: TextInputType.text,
                      controller: txtItemName,
                      decoration: const InputDecoration(
                        labelText: 'Informe o nome do item',
                      ),
                          // Validar se campo está vazio
                      validator: (value) {
                        if (value == null) {
                          return 'Campo vazio';
                        } else if (value.isEmpty) {
                          return 'Campo vazio';
                        }
                        return null;
                      },

              )
            ],),
          ),
        )
    );
  }
}