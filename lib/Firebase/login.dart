import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tts06e/BNB/main_screen.dart';
import 'package:tts06e/Firebase/home.dart';
import 'package:tts06e/Firebase/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHide = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      final SharedPreferences userLog = await SharedPreferences.getInstance();
      userLog.setString("userEmail", email.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User LoggedIn Successfully")));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${e.code}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                width: 400,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 150,
                      height: 150,
                    ),
                    const Text(
                      'Login to Your Account',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffE7EDED),
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              const BorderSide(color: Color(0xffE7EDED)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: isHide,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffE7EDED),
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          icon: isHide
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              const BorderSide(color: Color(0xffE7EDED)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        userLogin();
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'or continue with',
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 27),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              width: 40,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              width: 40,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 26),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'dont have an account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
