import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List names = ["Fiza", "Iqra", "Laiba", "Abdul Samee Khan","Faisal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) => IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: const Icon(Icons.category)),),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.purple.shade300,
            ),

            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),

            const ListTile(
              leading: Icon(Icons.privacy_tip_rounded),
              title: Text("Privacy"),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),

            const ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),

            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward_outlined),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              // Background Container

             const SizedBox(
                width: double.infinity,
                height: 250,
              ),

              Container(
                width: double.infinity,
                height: 180,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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

              const Positioned(
                left: 130,
                top: 190,
                child: Text("John Doe", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),),
              )

            ],
          ),

          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
            child: const Row(
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
          ),

          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: names.length, // 5
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.purple,
                              Colors.pink,
                              Colors.red])
                      ),
                      child: Container(
                        width: 58,
                        height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                        // image: DecorationImage(image: NetworkImage("data:image/jpeg;base64,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"))
                      ),
                      ),
                    ),
                    Container(
                        width: 60,
                        alignment: Alignment.center,
                        child: Text(names[index],overflow: TextOverflow.ellipsis,))
                  ],
                ),
              );
            },),
          ),
        ],
      ),
    );
  }
}
