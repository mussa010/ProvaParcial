import 'package:flutter/material.dart';

class CreateAccout extends StatefulWidget {
  const CreateAccout({super.key});

  @override
  State<CreateAccout> createState() => _CreateAccout();
}

class _CreateAccout extends State<CreateAccout> {
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
    );
  }
}