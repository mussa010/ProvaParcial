// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../model/user.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  //chave formulário
  var formKey = GlobalKey<FormState>();
  var status = false;

  //controladores para campo de texto
  var txtName = TextEditingController();
  var txtCpf = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();

  var mascaraCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#" : RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy
  );

  caixaDialogo(context, titulo, mensagem) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, 'Voltar'),
          child: const Text('Voltar'))


        ],

      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de cadastro',
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
        body: SingleChildScrollView(
          child:  Column(children: [
            Container(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width,
              decoration:  const BoxDecoration(
                color: Colors.blue, 
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
            child:  Form(
              key: formKey, 
              child: Column(children: [
                // Campo de inserção de nome
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtName,
                  decoration: InputDecoration( 
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: const Icon(Icons.person, color: Colors.red)
                  ), 
                  validator: (value) {
                    if(value == null) {
                      return 'Campo vazio';
                    } else if(value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Campo de inserção de cpf
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [mascaraCpf],
                  controller: txtCpf,
                  decoration: InputDecoration( 
                    labelText: 'CPF',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: const Icon(Icons.assignment_ind,color: Colors.red),
                  ),
                  validator: (value) {
                    if(value == null) {
                      return 'Campo vazio';
                    } else if(value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Campo de inserção de e-mail
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                  decoration: InputDecoration( 
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: const Icon(Icons.email,color: Colors.red),
                  ),
                  validator: (value) {
                    if(value == null) {
                      return 'Campo vazio';
                    } else if(value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Campo de inserção de senha
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration( 
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: const Icon(Icons.password, color: Colors.red)
                  ),
                  validator: (value) {
                    if(value == null) {
                      return 'Campo vazio';
                    } else if(value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Campo de confirmar senha
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration( 
                    labelText: 'Confirmar senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon: const Icon(Icons.password, color: Colors.red)
                  ),
                  validator: (value) {
                    if(value == null) {
                      return 'Campo vazio';
                    } else if(value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      // Algoritmo para criar conta e salvar no banco de dados
                      if(txtPassword.text == txtConfirmPassword.text) {
                        // User newUser = User(name: txtName.text, cpf: txtCpf.text, email: txtEmail.text, password: txtPassword.text);
                        print('Tudo certo');
                        txtName.clear();
                        txtCpf.clear();
                        txtEmail.clear();
                        txtPassword.clear();
                        txtConfirmPassword.clear();
                      } else {
                        setState(() {
                          var titulo = "Erro";
                          var mensagem = 'Senha incorreta';
                          caixaDialogo(context, titulo, mensagem);
                        });
                      }
                    }
                  }, child: const Text('Criar conta'))
              ],)),
            )
          ], 
          crossAxisAlignment: CrossAxisAlignment.center)
        )

    );
  }
}