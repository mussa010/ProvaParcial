// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

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
  var txtcpf = TextEditingController();
  var txtMail = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();

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
          leading: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child:  Column(children: [
            Padding(padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
            child:  Form(
              key: formKey, 
              child: Column(children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtName,
                  decoration: InputDecoration( 
                    labelText: 'Informe seu nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    icon: const Icon(Icons.person, color: Colors.blue,)

                  )
                )

              ],)),
            )
          ], 
          crossAxisAlignment: CrossAxisAlignment.center,)
        
        )

    );
  }
}