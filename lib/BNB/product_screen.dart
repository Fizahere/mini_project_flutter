import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  void addProductWithImage() async {
    String productID = Uuid().v1();
    if (kIsWeb) {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productID)
          .putData(webImage);
      TaskSnapshot taskSnapshot = await uploadTask;
      String productImageUrl = await taskSnapshot.ref.getDownloadURL();
      addProduct(productID, productImageUrl);
    } else {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productID)
          .putFile(userImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String productImageUrl = await taskSnapshot.ref.getDownloadURL();
      addProduct(productID, productImageUrl);
    }
  }

  void addProduct(String productID, String imageUrl) async {
    try {
      // await FirebaseFirestore.instance.collection("Product").add({
      //   "productName" : pName.text,
      //   "productPrice" : pPrice.text,
      //   "productCate" : defaultCate
      // });
      await FirebaseFirestore.instance
          .collection("Product")
          .doc(productID)
          .set({
        "productID": productID,
        "productName": pName.text,
        "productPrice": pPrice.text,
        "productCate": defaultCate,
        "image": imageUrl
      });
      Navigator.pop(context); // Bottom Sheet
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Product Added"))); // stf
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void updateProduct(String pID) async {
    try {
      // await FirebaseFirestore.instance.collection("Product").add({
      //   "productName" : pName.text,
      //   "productPrice" : pPrice.text,
      //   "productCate" : defaultCate
      // });
      await FirebaseFirestore.instance.collection("Product").doc(pID).update({
        "productName": pName.text,
        "productPrice": pPrice.text,
        "productCate": defaultCate
      });
      Navigator.pop(context); // Bottom Sheet
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product Updated"))); // stf
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  File? userImage; // Applications
  Uint8List webImage = Uint8List(8); // web

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Product").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            var dataLength = snapshot.data!.docs.length;

            return dataLength != 0
                ? ListView.builder(
                    itemCount: dataLength,
                    itemBuilder: (context, index) {
                      String productName =
                          snapshot.data!.docs[index]["productName"];
                      String productPrice =
                          snapshot.data!.docs[index]["productPrice"];
                      String productCate =
                          snapshot.data!.docs[index]["productCate"];
                      String productImage = snapshot.data!.docs[index]["image"];
                      String productID =
                          snapshot.data!.docs[index]["productID"];

                      return ListTile(
                        title: Text(productName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productPrice),
                            Text(productCate),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(productImage),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      elevation: 0,
                                      context: context,
                                      builder: (context) {
                                        pName.text = productName;
                                        pPrice.text = productPrice;
                                        defaultCate = productCate;

                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            // Values Update in Bottom Sheet
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller: pName,
                                                    validator: (val) {
                                                      if (val == " " ||
                                                          val != null) {
                                                        return "Fill the Field";
                                                      }
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Enter Product Name"),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextFormField(
                                                    controller: pPrice,
                                                    validator: (val) {
                                                      if (val == " " ||
                                                          val != null) {
                                                        return "Fill the Field";
                                                      }
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Enter Product Price"),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  DropdownButton(
                                                    hint: const Text(
                                                        'Please choose a Category'), // Not necessary for Option 1
                                                    value: defaultCate,
                                                    onChanged: (Val) {
                                                      setState(() {
                                                        defaultCate = Val;
                                                        debugPrint(defaultCate);
                                                      });
                                                    },
                                                    items: cate.map((value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        updateProduct(
                                                            productID);
                                                      },
                                                      child:
                                                          const Text("Update"))
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.update,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("Product")
                                        .doc(productID)
                                        .delete();
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("Nothing to show"),
                  );
          }

          if (snapshot.hasError) {
            return Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              elevation: 0,
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    // Values Update in Bottom Sheet
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? pickImage = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (kIsWeb) {
                                if (pickImage != null) {
                                  var convertedFile =
                                      await pickImage.readAsBytes();
                                  setState(() {
                                    webImage = convertedFile;
                                  });
                                }
                              } else {
                                if (pickImage != null) {
                                  File convertedFile = File(pickImage.path);
                                  setState(() {
                                    userImage = convertedFile;
                                  });
                                }
                              }
                            },
                            child: kIsWeb
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: webImage != null
                                        ? MemoryImage(webImage!)
                                        : null,
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: userImage != null
                                        ? FileImage(userImage!)
                                        : null,
                                  ),
                          ),
                          TextFormField(
                            controller: pName,
                            validator: (val) {
                              if (val == " " || val != null) {
                                return "Fill the Field";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Product Name"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          TextFormField(
                            controller: pPrice,
                            validator: (val) {
                              if (val == " " || val != null) {
                                return "Fill the Field";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "Enter Product Price"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButton(
                            hint: const Text(
                                'Please choose a Category'), // Not necessary for Option 1
                            value: defaultCate,
                            onChanged: (Val) {
                              setState(() {
                                defaultCate = Val;
                                debugPrint(defaultCate);
                              });
                            },
                            items: cate.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                addProductWithImage();
                              },
                              child: const Text("Add"))
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
