import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tts06e/BNB/cart_screen.dart';
import 'package:tts06e/BNB/home_screen.dart';
import 'package:tts06e/BNB/product_screen.dart';
import 'package:tts06e/BNB/profile_screen.dart';

import '../Firebase/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> myScreens = [
    HomePage(),
    ProductScreen(),
    CartScreen(),
    PersonScreen()
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: pageShifter,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Product"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]
      ),
    );
  }
}


