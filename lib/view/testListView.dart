import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../repositories/userRepository.dart';

class TestListView extends StatefulWidget {
  const TestListView({super.key});

  @override
  State<TestListView> createState() => _TestListView();
}

class _TestListView extends State<TestListView> {
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
    List<User> listUser = Provider.of<Repository>(context).getListAllUser;
    if(listUser.isEmpty) {
      return Scaffold(appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de lista de usuários',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('Não há usuário cadastrado', style: TextStyle(
            color: Colors.white, 
            backgroundColor: Colors.blue)
          ),
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de lista de usuários',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.blue,
          
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
                itemCount: listUser.length,
                itemBuilder: (BuildContext context, int index) {
                    return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: 
                        Text('Nome: ${listUser[index].getName}\nEmail: ${listUser[index].getEmail}'),
                      subtitle: Text('Senha: ${listUser[index].getPassword}'),
                    )
                  );
                  
                },
              )
      )
    );
  }
}