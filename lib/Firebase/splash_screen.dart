import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tts06e/BNB/main_screen.dart';
import 'package:tts06e/Firebase/home.dart';
import 'package:tts06e/Firebase/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getDetails() async {
    SharedPreferences userLog = await SharedPreferences.getInstance();
    var email = userLog.getString("userEmail");
    if (email != null) {
      Timer(
          const Duration(milliseconds: 1000),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              )));
    } else {
      Timer(
          const Duration(milliseconds: 1000),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              )));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
