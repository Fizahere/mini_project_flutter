import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GoogleSigninService.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController userEmail=TextEditingController();
  TextEditingController userPassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Container(
          child: Form(
              child:Column(
                children: [
                  TextFormField(
                    controller: userEmail,
                    decoration: InputDecoration(
                      label: Text('Email**'),
                      suffixIcon: Icon(Icons.email_outlined,color: Colors.orange,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: userPassword,
                    decoration: InputDecoration(
                      label: Text('Password**'),
                      suffixIcon: Icon(Icons.lock_outline,color: Colors.orange,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreenComponent()));
                  //     String u_email=userEmail.text;
                  //     String u_password=userPassword.text;
                  //     if(u_email.isNotEmpty && u_password.isNotEmpty){
                  //       FirebaseAuth.instance.createUserWithEmailAndPassword(email:u_email,password:u_password);
                  //     }
                  //   },
                  //   child: Center(
                  //     child: Text(
                  //       'Sign Up',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  //   ),
                  // )
                  ElevatedButton(
                    onPressed: ()  {
                      signInWithGoogle();
                      // UserCredential? userCredential = await signInWithGoogle();
                      // if (userCredential != null) {
                      //   print('User signed in: ${userCredential.user!.displayName}');
                      // } else {
                      //   print('Error signing in with Google');
                      // }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.signal_cellular_connected_no_internet_0_bar),
                        Text('Sign In with Google'),
                      ],
                    ),
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
