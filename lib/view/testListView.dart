import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
import '../database/connection.dart';
import '../database/userDAO.dart';
import '../model/user.dart';

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
          // TextButton(
          //   onPressed: () => Navigator.pop(context, 'cancelar'),
          //   child: const Text('cancelar'),
          // ),
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
        child: FutureBuilder<List<User>>(
          future: UserDAO().getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot ) {
            //Verificar se banco de dados existe
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  User item = snapshot.data![index];
                  if(Connection.isConnected() == false){
                    dialogBox(context, 'Erro', 'Falha na conexão com banco de dados');
                    Navigator.pop(context,'ok');
                  }
                  else{
                    return Card(
                    child: ListTile(

                      leading: const Icon(Icons.person),
                      title: 
                        Text('Id: ${item.getId}\nNome: ${item.getName}\nE-mail: ${item.getEmail}'),
                      subtitle: Text('Senha: ${item.getPassword}'),
                    )
                  );
                  }
                  return null;
                },
              );
            } else {
              // const String mensagem = 'Banco de dados não possui dado cadastrado';
              //   dialogBox(context, 'Erro', mensagem);
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      )
    );
  }
}