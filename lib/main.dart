import 'package:flutter/material.dart';
import 'package:tts06e/profile_screen.dart';
import 'package:tts06e/row_example.dart';
import 'package:tts06e/stack_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("I am in Column Body"),
            Text("24"),
            Text("I am in Column Body"),
          ],
        ),
      ),
    );
  }
}
