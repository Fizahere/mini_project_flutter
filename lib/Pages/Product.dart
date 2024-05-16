import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  final TextEditingController name=TextEditingController();
  final TextEditingController location=TextEditingController();
  final TextEditingController description=TextEditingController();
  // TextEditingController viewer=TextEditingController();
  List viewers=['followers','everyone','the people you follow'];
  dynamic defaulVal='followers';

  // void addProduct()async{
  //   String postId=Uuid().v1();
  //   try{
  //     await FirebaseFirestore.instance.collection('Posts').add(
  //       {
  //         // 'PostID':postId,
  //         'Name': name.text,
  //         'Description': description.text,
  //         'Location': location.text,
  //         'Viewers':defaulVal,
  //       }
  //     );
  //     Navigator.pop(context);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Post added')));
  //   }
  //   catch(e){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  //
  // }

  void addProduct()async{
    String PostID = Uuid().v1();
    try{
      await FirebaseFirestore.instance.collection("Product").doc(PostID).set({
        "PostID" : PostID,
        "Name" : name.text,
        "Description" : description.text,
        "Location" : location.text,
        "Viewers" : defaulVal
      });
      Navigator.pop(context); // Bottom Sheet
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Added"))); // stf
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(child: Text('Products'),),

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
              addProduct();
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
    );
  }
}
