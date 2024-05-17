import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Pages/Product.dart';
import 'package:insta_clone/Pages/Profile.dart';
import 'Pages/Form.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/home': (context) => Profile(),
        '/likes': (context) => Product(),
        '/search': (context) => LoginForm(),
        '/profile': (context) => LoginForm(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Product(),
    );
  }
}

