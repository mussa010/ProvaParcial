import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import '../view/login.dart';
import '../model/user.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MainApp()));
  // runApp(const MainApp());
  String name = 'Matheus Teixeira Mussalam';
  String cpf = '1234567890';
  String mail = 'matheus.mussalam@sou.unaerp.edu.br';
  String password = '1234567890';

  List<User> listUser = [];

  listUser.add(User(name: name, cpf: cpf,mail: mail, password: password));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
