// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../repositories/repository.dart';
import 'package:provider/provider.dart';
import '../model/itemsList.dart';

class EditItemList extends StatefulWidget {
  const EditItemList({super.key});

  @override
  State<EditItemList> createState() => _EditItemList();
}

class _EditItemList extends State<EditItemList> {
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
    String shoppingListName = Provider.of<Repository>(context).getSelectedShoppingList().getName;
    ItemsList item = Provider.of<Repository>(context).getSelectedItem();
    final save = Provider.of<Repository>(context);
    bool bought = false;

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
                setState(() {
                  
                  ItemsList it = ItemsList(productName: txtItemName.text, shoppingListName: shoppingListName, quantity:int.parse(txtQuantity.text), bought: bought);
                  save.editItem(it);
                  txtItemName.clear();
                  txtQuantity.clear();
                });
                dialogBox(context, 'Item da lista', 'Item salvado com sucesso');
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
                initialValue: item.getProductName,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              TextFormField(
                initialValue: item.getProductQuantity.toString(),
                keyboardType: TextInputType.number,
                      controller: txtQuantity,
                      decoration: const InputDecoration(
                        labelText: 'Informe a quantidade do item',
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 60),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          bought = true;
                        });
                      },
                      child: const Text('Comprado'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 60),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          bought = false;
                        });
                      },
                      child: const Text('Não comprado')
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 60),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          txtItemName.clear();
                          txtQuantity.clear();
                        });
                        dialogBox(context, 'Apagando item', 'Item apagado com sucesso');
                        save.removeItem(item);
                      },
                      child: const Text('Remover item')
              )
            ],),
          ),
        )
    );
  }
}