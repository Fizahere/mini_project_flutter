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
  List data=[
    {'name':'Fiza','image':'sukuna.jpeg'},
    {'name':'Ifra','image':'background.jpeg'},
    {'name':'Era','image':'recent-2.jpg'},
    {'name':'John','image':'recent-5.jpg'},
    {'name':'Ali','image':'gojo.jpeg'},
    {'name':'Fiza','image':'Image-03.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      
      appBar:AppBar(
        // backgroundColor: Colors.black,
        title: Container(
          margin:EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Text(
            'imfiza234',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
          ),
        ),
        centerTitle: false,
      ),
      endDrawer: Drawer(
       child:   Column(
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
           Column(
             children: [
               ListTile(
                 leading: Icon(Icons.settings),
                 title: Text('Settings'),
               ),
               ListTile(
                 leading: Icon(Icons.info),
                 title: Text('App Info'),
               ),
               ListTile(
                 leading: Icon(Icons.logout),
                 title: Text('Logout'),
               )
             ],
           ),
         ],
       ),

      ),
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.bottomRight, // Aligning the stack to the bottom right
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('images/pfp.jpeg'),
                      radius: 50,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 25, // Adjust this according to your needs
                        width: 25, // Adjust this according to your needs
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18, // Adjust this according to your needs
                        ),
                      ),
                    ),
                  ],
                ),
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
          ),
Expanded(
  child: Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
      return Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.pink, Colors.yellow],
                  ),
                ),
              ),
              Positioned(
                left: 11, // Adjust these values to center the black box
                top: 13, // Adjust these values to center the black box
                child: Container(
                  width: 54,
                  height: 54,
                  alignment: Alignment.center,
                  child:CircleAvatar(radius:50,backgroundImage: AssetImage('images/${data[index]["image"]}'),
                  ),
                ),
              ),
            ],
          ),
          Text(data[index]['name'],style: TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,)
        ],
      );
    }),
  ),
),
Container(
  height: 2,
  width: double.infinity,
  color: Colors.black,
),
Grid(),
        ],
      )
      ,
    );
  }
}
