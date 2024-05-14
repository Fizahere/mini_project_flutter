import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tts06e/Firebase/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isHide = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void userRegister()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Registered Successfully")));
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.code}")));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
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
                    const Text('Login to Your Account' ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
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
                          borderSide: const BorderSide(color: Color(0xffE7EDED)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
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
                          icon: isHide ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        ),
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Color(0xffE7EDED)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: (){
                        debugPrint("$email");
                        debugPrint("$password");
                        userRegister();
                      },
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue
                        ),
                        child: const Center(child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text('or continue with',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold),),
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
                            const Text('Already have an account?',style: TextStyle(color: Colors.grey),),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                              },
                              child: const Text('Login',style: TextStyle(color: Colors.blue),),
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