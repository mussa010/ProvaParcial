import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
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
                        Text('${item.getId}\n${item.getName}\n${item.getEmail}'),
                      subtitle: Text('Senha: ${item.getPassword}'),
                    )
                  );
                  }
                },
              );
            } else {

            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      )
    );
  }
}