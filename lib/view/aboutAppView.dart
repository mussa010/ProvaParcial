import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    const  String about = '''
      Nome do Criador: 
      Matheus Teixeira Mussalam\n
      Código: 
      836445\n
      Sobre: 
      App desenvolvido para criação de lista de compras com criação, edição e remoção de itens
    ''';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text(
            'Sobre o aplicativo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
            ),
          ), 
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50)),
              child: const Text(about),
            ),
          ),
        ],))
    );
  }
}

