import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tts06e/BNB/main_screen.dart';
import 'package:tts06e/BNB/product_screen.dart';
import 'package:tts06e/Firebase/login.dart';
import 'package:tts06e/Firebase/splash_screen.dart';
import 'package:tts06e/firebase_options.dart';
import 'package:tts06e/profile_screen.dart';
import 'package:tts06e/row_example.dart';
import 'package:tts06e/stack_example.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
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
