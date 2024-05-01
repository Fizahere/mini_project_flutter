import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Grid.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Stack(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                // color: Colors.orange,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('images/background.jpeg', fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 30,
                top: 160,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/pfp.jpeg'),
                  radius: 50,
                ),
              ),
              Positioned(
                  left:150,
                  top: 215,
                  child: Text('Im Fiza',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('25k'),
                  Text('Followers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(
                height: 10,
                child: VerticalDivider(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Text('20k'),
                  Text('Likes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(
                height: 10,
                child: VerticalDivider(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  Text('7k'),
                  Text('Follows',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
Grid(),
        ],
      )
      ,
    );
  }
}
