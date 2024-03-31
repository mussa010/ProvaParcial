import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import '../view/login.dart';
import '../view/createAccount.dart';
import '../view/aboutApp.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MainApp()));
  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de compras',
      debugShowCheckedModeBanner: false,

      //Rotas de navegação
      initialRoute: 't1',
      routes: {
        't1': (context) =>  const Login(),
        't2': (context) => const AboutApp(),
        't3':(context) =>  const CreateAccount(),
      }

    );
  }
}