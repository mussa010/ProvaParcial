import 'package:flutter/material.dart';

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
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  caixaDialogo(context, titulo, mensagem) {
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
          leading: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: Colors.blue[400],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
          child: Form(
              key: formKey,
              child: Column(children: [
                Image.asset('lib/imagens/login.png', width: 100, height: 100),
                SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtUsuario,
                  decoration: InputDecoration(
                      labelText: 'Informe seu e-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      icon: const Icon(
                        Icons.mail,
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
                SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: txtSenha,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Informe sua senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      icon: const Icon(
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue[400],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //Validação com sucesso
                      setState(() {
                        var txt1 = txtUsuario.text;
                        var txt2 = txtSenha.text;

                        var msg = 'Usuario: $txt1\nSenha: $txt2';
                        caixaDialogo(context, "Usuário e senha", msg);
                      });
                    }
                  },
                  child: const Text('Logar'),
                ),
                SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                    backgroundColor: Colors.blue[400],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Criar usuário'),
                ),
              ])),
        )));
  }
}
