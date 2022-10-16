import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  final CollectionReference _Products =
      FirebaseFirestore.instance.collection("Products");
// ==================================================================================
// to do update
  final TextEditingController _brandnameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _brandnameController.text = documentSnapshot["BrandName"];
      _priceController.text = documentSnapshot["Price"];
      _imageController.text = documentSnapshot["image"];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                    controller: _brandnameController,
                    decoration: const InputDecoration(labelText: "BrandName")),
                TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: "Price")),
                TextField(
                    controller: _imageController,
                    decoration: const InputDecoration(labelText: "image")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      final String BrandName = _brandnameController.text;
                      final String Price = _priceController.text;
                      final String image = _imageController.text;
                      if (Price != null) {
                        await _Products.doc(documentSnapshot!.id).update({
                          "BrandName": BrandName,
                          "Price": Price,
                          "image": image
                        });
                      }
                    },
                    child: const Text("Update"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 13, 43, 46),
                    ))
              ],
            ),
          );
        });
  }


// ==================================================================================
// To do create

  Future _create([DocumentSnapshot? documentSnapshot]) async {
    // if (documentSnapshot != null) {
    //   _brandnameController.text = documentSnapshot["BrandName"];
    //   _priceController.text = documentSnapshot["Price"];
    //   _imageController.text = documentSnapshot["image"];
    // }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                    controller: _brandnameController,
                    decoration: const InputDecoration(labelText: "BrandName")),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: "Price")),
                TextField(
                    controller: _imageController,
                    decoration: const InputDecoration(labelText: "image")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      final String BrandName = _brandnameController.text;
                      final String Price = _priceController.text;
                      final String image = _imageController.text;
                      if (Price != null) {
                        await _Products.add({
                          "BrandName": BrandName,
                          "Price": Price,
                          "image": image
                        });
                      }
                    },
                    child: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 13, 43, 46),
                    ))
              ],
            ),
          );
        });
  }

// ===============================================================================
// to do delet
Future<void> _delete(String productId) async {
    await _Products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

// ===============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 11, 45, 50), // add button
          child: Icon(Icons.add),
          onPressed: () => _create()),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Image.asset("images/Logo.png"),
        backgroundColor: Color.fromARGB(255, 9, 60, 66),
        leading: Icon(Icons.emoji_emotions_outlined),
        toolbarHeight: 150,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: _Products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot["BrandName"]),
                      subtitle: Text(documentSnapshot["Price"].toString()),
                      leading: Image.network(documentSnapshot["image"]),
                      trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => _update(documentSnapshot),
                                  icon: Icon(Icons.edit_note_outlined)),
                              IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _delete(documentSnapshot.id)),
                            ],
                          )),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

// // ignore_for_file: prefer_const_constructors

// import 'dart:developer';

// import 'package:flowerio_app/core/constants.dart';
// import 'package:flowerio_app/features/mainView/presentation/Services/Products_service.dart';
// import 'package:flowerio_app/features/mainView/presentation/widgets/Models/ProudectsModels.dart';
// import 'package:flutter/material.dart';

// class MainViewBody extends StatefulWidget {
//   const MainViewBody({super.key});

//   @override
//   State<MainViewBody> createState() => _MainViewBodyState();
// }

// class _MainViewBodyState extends State<MainViewBody> {
//   ProductService productService = ProductService();
//   ProductList? productList;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kMainColor,

//         title: Text('Firestore'),
//       ),
//       body: StreamBuilder(
//         stream: productService.getProducts().asStream(),
//         builder: (context, snapshot) {
//           var data = snapshot.data;
//           if (data == null) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.teal,
//                 strokeWidth: 3,
//               ),
//             );
//           }
//           productList = data;

//           if (productList!.products.isEmpty) {
//             return Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                       text: 'OOPs\n',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         TextSpan(
//                           text: 'Not Item is Found\n\n',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                           ),
//                         ),
//                         // TextSpan(
//                         //     text: 'Add Item now',
//                         //     style: TextStyle(
//                         //       color: Colors.blue,
//                         //       fontSize: 20,
//                         //     ),
//                         //     recognizer: TapGestureRecognizer()
//                         //       ..onTap = () {
//                         //         Navigator.of(context).pushNamed(
//                         //             addEditPostRoute,
//                         //             arguments: 'add');
//                         //       })
//                       ]),
//                 ),
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: productList!.products.length,
//             itemBuilder: (ctx, index) {
//               log('Entering Listview');
//               var item = productList!.products[index];
//               return ListTile(
//                 leading: Image.network(item.image!),
//                 title: Text(
//                   item.brandName!,
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 trailing: Text(
//                   item.price!,
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           // Navigator.of(context).pushNamed(addEditPostRoute, arguments: 'add');
//         },
//       ),

//     );
//   }
// }
