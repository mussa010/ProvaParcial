// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../model/user.dart';
// import '../model/shoppingList.dart';

// class MenuShoppingListView extends StatefulWidget {
//   const MenuShoppingListView({super.key});

//   @override
//   State<MenuShoppingListView> createState() => _MenuShoppingListView();
// }

// class _MenuShoppingListView extends State<MenuShoppingListView> {

//   dialogBox(context, titulo, mensagem) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: Text(titulo),
//         content: Text(mensagem),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context, 't1'),
//             child: const Text('ok'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override

//   Widget build(BuildContext context) {
//     var email = ModalRoute.of(context)!.settings.arguments;
//     final emailString = email.toString();
//     // final shoppingList = db.getShoppingList(emailString);

//     return  Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//       padding: const EdgeInsets.all(20),
//       child: FutureBuilder<List<ShoppingList?>>(
//         future: , 
//         builder: ( context, AsyncSnapshot<List<ShoppingList?>> snapshot) {
//           if(snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   ShoppingList? item = snapshot.data![index];
//                     return Card(
//                     child: ListTile(

//                       leading: const Icon(Icons.person),
//                       title: 
//                         Text('Nome do criador: ${item!.getCreatorName}\nNome da lista: ${item.getName}\n'),
//                       // subtitle: Text('Id: ${item.getId}'),
//                     )
//                   );
//                 },
//               );
//           } else {
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               width:  MediaQuery.of(context).size.width * 0.8,
//               alignment: Alignment.center,
//                 child: const Text('Não há lista cadastrado',
//                 style: TextStyle(
//                   backgroundColor: Colors.blue,
//                   color: Colors.white
//                 ),
//               )
//             );
//           }
//         }
//       ), 
//     )
//     );
//   }
// }
