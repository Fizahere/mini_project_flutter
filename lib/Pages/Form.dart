import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController userEmail=TextEditingController();
  TextEditingController userPassword=TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF0F0F0),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 75,horizontal: 35),
        child: Container(
          color: Colors.white,
          child: Form(
              child:Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                Image.asset('images/insta_name.png',height: 140,width: 140,),
                    TextFormField(
                      controller: userEmail,
                      decoration: InputDecoration(
                        label: Text('Email**'),
                        suffixIcon: Icon(Icons.email_outlined,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: userPassword,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
    ElevatedButton(
    onPressed: () async {
    String u_email = userEmail.text;
    String u_password = userPassword.text;
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: u_email, password: u_password);
    }on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
    SnackBar(
    content: Text(e.toString()),
    ),
    );
    }
    },
    child: Center(
    child: Text(
    'Sign Up',
    style: TextStyle(color: Colors.white),
    ),
    ),
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    ),
    ),
                   Text('or',),
                    ButtonUtils.googleButton(),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
