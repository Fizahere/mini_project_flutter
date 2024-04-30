import 'package:flutter/material.dart';


class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),

          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),

          Container(
            width: 50,
            height: 50,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
