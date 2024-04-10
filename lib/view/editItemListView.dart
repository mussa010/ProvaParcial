import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repositories/repository.dart';
import '../model/itemsList.dart';

class EditItemList extends StatefulWidget {
  const EditItemList({super.key});

  @override
  State<EditItemList> createState() => _EditItemListState();
}

class _EditItemListState extends State<EditItemList> {
  var formKey = GlobalKey<FormState>();
  var txtItemName = TextEditingController();
  var txtQuantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String shoppingListName = Provider.of<Repository>(context).getSelectedShoppingList().getName;
    final save = Provider.of<Repository>(context);
    ItemsList item = Provider.of<Repository>(context).getSelectedItem();
    txtItemName.text = item.getProductName;
    txtQuantity.text = item.getProductQuantityString;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              if (txtItemName.text.isEmpty && txtQuantity.text.isEmpty) {
                dialogBox(context, 'Item da lista', 'Item não editado');
              } else {
                item.setProductName = txtItemName.text;
                  item.setProductQuantity = int.parse(txtQuantity.text);
                  ItemsList it = ItemsList(
                    productName: item.getProductName,
                    shoppingListName: shoppingListName,
                    quantity: item.getProductQuantity,
                    bought: item.getBought,
                  );
                save.editItem(it);
                dialogBox(context, 'Item da lista', 'Item salvo com sucesso');
              }
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Nome atual do item: ${item.getProductName}'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text('Quantidade atual do item: ${item.getProductQuantity}'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtItemName,
                  onChanged: (value) {
                    item.setProductName = txtItemName.text;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Informe o novo nome do item',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: txtQuantity,
                  onChanged: (value) {
                    item.setProductQuantityToInt = txtQuantity.text;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Informe a nova quantidade do item',
                  ),
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
                      item.setProductName = txtItemName.text;
                      item.setProductQuantity = int.parse(txtQuantity.text);
                      item.setBought = true;
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
                      item.setProductName = txtItemName.text;
                      item.setProductQuantity = int.parse(txtQuantity.text);
                      item.setBought = false;
                    });
                  },
                  child: const Text('Não comprado'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    dialogBox(context, 'Apagando item', 'Item apagado com sucesso');
                    save.removeItem(item);
                    setState(() {
                      item.setProductName = '';
                      item.setProductQuantity = 0;
                      txtItemName.clear();
                      txtQuantity.clear();
                    });
                  },
                  child: const Text('Remover item'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
