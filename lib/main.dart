import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../repositories/repository.dart';
import 'package:provider/provider.dart';

import 'view/createItemListView.dart';
import 'view/testListView.dart';
import 'view/loginView.dart';
import 'view/createAccountView.dart';
import 'view/aboutAppView.dart';
import 'view/menuShoppingListView.dart';
import 'view/createShoppingListView.dart';
import 'view/menuItemsListView.dart';
import 'view/editItemListView.dart';
import 'view/searchShoppingListView.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue

    )
  );

  runApp(
    ChangeNotifierProvider(create: (context) => Repository(),
      child: DevicePreview(
       enabled: true,
        builder: (context) => const MainApp())),
    );
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
        't4': (context) => const TestListView(),
        't5' : (context) => const AboutApp(),
        't6' : (context) => const MenuShoppingListView(),
        't7' : (context) => const CreatShoppingList(),
        't8' : (context) => const MenuItemListView(),
        't9' : (context) => const CreatItemList(),
        't10' : (context) => const EditItemList(),
        't11' : (context) => const SearchShoppingByItem()
      }
    );
  }
}