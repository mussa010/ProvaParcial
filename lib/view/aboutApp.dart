import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container( 
            alignment:Alignment.bottomLeft,
            color: Colors.blue,
            child: IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(
                Icons.arrow_back, 
                color: Colors.white
              )
            )
          ),
        ],

      ),
    );
  }
}