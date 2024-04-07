import 'package:flutter/material.dart';
import 'package:prova_parcial/repositories/userRepository.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  //chave formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //Controladores para os campos de texto
  var txtUser = TextEditingController();
  var txtPassword = TextEditingController();

  
  dialogBox(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'cancelar'),
            child: const Text('cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'ok'),
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
      listUser.add(User(email: 'admin@admin', name: 'admin', password: 'admin'));
      Provider.of<Repository>(context).saveAll(listUser);
    } else {
    }
    txtUser.text = '';
    txtPassword.text = '';
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => Navigator.pushNamed(context, 't4', arguments: listUser),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                // Container com imagem e tamanho responsivo
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration:  const BoxDecoration(
                    color: Colors.blue, 
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
                  ),
                  child: Image.asset('lib/imagens/login.png')
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                  child: Form(
                  key: formKey,
                  child: Column(children: [
                    // Campo de e-mail
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: txtUser,
                      decoration: InputDecoration(
                          labelText: 'Informe seu e-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.red,
                          )),
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
                    SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
                    // Campo de senha
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: txtPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Informe sua senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.red,
                          )),
                      validator: (value) {
                        if (value == null) {
                          return 'Campo vazio';
                        } else if (value.isEmpty) {
                          return 'Campo vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 0.05 * (MediaQuery.of(context).size.height)),
                    // Botão para acessar aplicativo
                    // Se o usuário existir e as informações estiverem corretas, o usuário irá para a tela seguinte
                    // Senão, aparecerá uma mensagem de erro mostrando que, ou usuário não existe ou algum campo está errado
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 60),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          bool founded = false;
                          //Validação com sucesso

                          //Continuar daqui
                          for(User user in listUser) {
                            if(txtUser.text == user.getEmail && txtPassword.text == user.getPassword) {
                              founded = true;
                              Navigator.pushNamed(context, 't5');
                            } 
                          }
                          if(founded == false) {
                            dialogBox(context, 'Erro', 'Usuário ou senha incorreta');
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                    SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
                    // Botão para ir para tela de cadastro
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 60),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                         Navigator.pushNamed(context, 't3');
                      },
                      child: const Text('Criar conta'),
                    ),
                  ])),
                        ),
              ],
            )));
  }
}