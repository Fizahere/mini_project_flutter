import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final TextEditingController pName = TextEditingController();
  final TextEditingController pPrice = TextEditingController();
  List cate = ["Shirts", "Shoes", "Glasses", "Watches"];
  dynamic defaultCate = "Shirts";

  void addProduct()async{

    String pID = Uuid().v1();

    try{
      // await FirebaseFirestore.instance.collection("Product").add({
      //   "productName" : pName.text,
      //   "productPrice" : pPrice.text,
      //   "productCate" : defaultCate
      // });
      await FirebaseFirestore.instance.collection("Product").doc(pID).set({
        "productID" : pID,
        "productName" : pName.text,
        "productPrice" : pPrice.text,
        "productCate" : defaultCate
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
      // appBar: AppBar(
      //   title: Text("Product Screen"),
      //   centerTitle: true,
      // ) ,
      body: Center(child: Text("Product Screen"),),

      floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(
            elevation: 0,

            context: context, builder: (context) {
            return StatefulBuilder(builder: (context, setState) { // Values Update in Bottom Sheet
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextFormField(
                      controller: pName,
                      validator: (val){
                        if( val == " "  || val!=null ){
                          return "Fill the Field";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Product Name"
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      controller: pPrice,
                      validator: (val){
                        if( val == " "  || val!=null ){
                          return "Fill the Field";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Product Price"
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    DropdownButton(
                      hint: Text('Please choose a Category'), // Not necessary for Option 1
                      value: defaultCate,
                      onChanged: (Val) {
                        setState(() {
                          defaultCate = Val;
                          debugPrint(defaultCate);
                        });
                      },
                      items: cate.map((value) {
                        return DropdownMenuItem(
                          child: new Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),

                    ElevatedButton(onPressed: (){
                      addProduct();
                    }, child: Text("Add"))

                  ],
                ),
              );
            },);
          },);
      },child: Icon(Icons.add)),
    );
  }
}
