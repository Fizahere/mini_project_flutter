import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uuid/uuid.dart';

import '../components/bottomBar.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int _currentIndex = 0;
  final TextEditingController name=TextEditingController();
  final TextEditingController location=TextEditingController();
  final TextEditingController description=TextEditingController();
  List viewers=['followers','everyone','the people you follow'];
  dynamic defaulVal='followers';

  void addPost()async{
    String PostID = Uuid().v1();
    try{
      await FirebaseFirestore.instance.collection("Posts").doc(PostID).set({
        "PostID" : PostID,
        "Name" : name.text,
        "Description" : description.text,
        "Location" : location.text,
        "Viewers" : defaulVal
      });
      Navigator.pop(context); // Bottom Sheet
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post Added"))); // stf
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Posts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
                builder: (BuildContext context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasData){
                    var docsLength= snapshot.data?.docs.length;
                    return docsLength !=0 ? ListView.builder(
                      itemCount: docsLength,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          String postName=snapshot.data?.docs[index]['Name'];
                          String postDescription=snapshot.data?.docs[index]['Description'];
                          String postLocaton=snapshot.data?.docs[index]['Location'];
                          String postViewers=snapshot.data?.docs[index]['Viewers'];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(postName),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(postDescription),
                          Text(postLocaton),
                          // Text(postViewers),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Icon(Icons.edit, color: Colors.blue),
                        SizedBox(height: 10,),
                        Icon(Icons.delete_outline_outlined, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            );
                    })
            : Center(child: Text('no posts found'),);
                  };
                  if(snapshot.hasError){
                    return Center(child: Icon(Icons.error,color: Colors.red,),);
                  }
                  return Container();
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
            elevation: 0,
            context: context, builder: (context){
              return StatefulBuilder(builder: (context,setState){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                "what's new",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller:name,
              decoration: InputDecoration(label: Text('Name**')),
            ),
            TextFormField(
              controller:location,
              decoration: InputDecoration(label: Text('Location**')),
            ),
            TextFormField(
                controller: description,
              decoration: InputDecoration(label: Text('Description**')),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('who can see your posts:',
                    style:TextStyle(
                      fontSize: 16
                    )),
                SizedBox(width: 4,),
                DropdownButton(
                    value: defaulVal,
                    items: viewers.map((value) {
                  return DropdownMenuItem(
                      child: new Text(value),
                  value: value,
                  );
                }).toList(), onChanged: (val){
                setState((){
                  defaulVal=val;
                });
                // debugPrint(defaulVal);
                }),
              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
              addPost();
                // print('posted');
            },child: Center(
            child: Text(
            'Post',
              style: TextStyle(color: Colors.white),
            ),
    ),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),)
          ],
        ),
      ),
    );
              });
        });
      },child: Icon(Icons.add),),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/likes');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/search');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/profile');
                  break;
                default:
              }
            });
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),
            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.data_exploration),
              title: Text("Form"),
              selectedColor: Colors.pink,
            ),
            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),
            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        )
    );
  }
}
