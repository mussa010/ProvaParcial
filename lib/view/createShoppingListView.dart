import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prova_parcial/model/shoppingList.dart';
import 'package:prova_parcial/repositories/repository.dart';
import 'package:provider/provider.dart';

class CreatShoppingList extends StatefulWidget {
  const CreatShoppingList({super.key});

  @override
  State<CreatShoppingList> createState() => _CreatShoppingList();
}

class _CreatShoppingList extends State<CreatShoppingList> {
  //chave formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //controlador para campo de texto
  var txtName = TextEditingController();

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
    String userName = Provider.of<Repository>(context).getUsername;
    final save = Provider.of<Repository>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Nova lista',
            style: TextStyle(
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
              if(txtName.text.isEmpty) {
                dialogBox(context, 'Erro', 'Campo vazio');
              } else {
                ShoppingList sh = ShoppingList(listName: txtName.text, creatorName: userName);
                save.saveShoppingListUser(sh);
                setState(() {
                  txtName.clear();
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
              TextFormField(
                keyboardType: TextInputType.text,
                      controller: txtName,
                      decoration: const InputDecoration(
                        labelText: 'Informe o nome da lista',
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