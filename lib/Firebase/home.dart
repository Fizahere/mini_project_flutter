import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tts06e/Firebase/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userEmail = "";

  Future getUserDetail() async {
    SharedPreferences userLog = await SharedPreferences.getInstance();
    var email = userLog.getString("userEmail");
    return email;
  }

  void userLogout() async {
    SharedPreferences userLog = await SharedPreferences.getInstance();
    userLog.clear();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    // email => asad@gmail.com
    getUserDetail().then(
      (value) {
        setState(() {
          userEmail = value;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userEmail),
            ElevatedButton(
                onPressed: () {
                  userLogout();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
