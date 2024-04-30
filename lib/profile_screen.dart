import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Stack(
            children: [
              // Background Container

              Container(
                width: double.infinity,
                height: 250,
              ),

              Container(
                width: double.infinity,
                height: 180,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),

              Positioned(
                left: 30,
                top: 130,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade600,
                ),
              ),
              
              Text("")

            ],
          ),

          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  spreadRadius: 1
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("89k"),
                    Text("Followers",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),

                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    width: 2,
                    color: Colors.black,
                  ),
                ),

                Column(
                  children: [
                    Text("10k"),
                    Text("Likes",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),

                SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    width: 2,
                    color: Colors.black,
                  ),
                ),

                Column(
                  children: [
                    Text("75k"),
                    Text("Follows",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
