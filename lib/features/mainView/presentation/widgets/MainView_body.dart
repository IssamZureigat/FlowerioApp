// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flowerio_app/core/constants.dart';
import 'package:flowerio_app/features/mainView/presentation/Services/Products_service.dart';
import 'package:flowerio_app/features/mainView/presentation/widgets/Models/ProudectsModels.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  ProductService productService = ProductService();
  ProductList? productList;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kMainColor,leading: IconButton(icon: Icon(Icons.add), onPressed: () {  },),
        title: Text('Firestore'),
      ),
      body: StreamBuilder(
        stream: productService.getProducts().asStream(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
                strokeWidth: 3,
              ),
            );
          }
          productList = data;

          if (productList!.products.isEmpty) {
            return Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'OOPs\n',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextSpan(
                          text: 'Not Item is Found\n\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        // TextSpan(
                        //     text: 'Add Item now',
                        //     style: TextStyle(
                        //       color: Colors.blue,
                        //       fontSize: 20,
                        //     ),
                        //     recognizer: TapGestureRecognizer()
                        //       ..onTap = () {
                        //         Navigator.of(context).pushNamed(
                        //             addEditPostRoute,
                        //             arguments: 'add');
                        //       })
                      ]),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: productList!.products.length,
            itemBuilder: (ctx, index) {
              log('Entering Listview');
              var item = productList!.products[index];
              return ListTile(
                leading: Image.network(item.image!),
                title: Text(item.brandName!,style: TextStyle(color: Colors.black),),
                trailing: Text(item.price!,style: TextStyle(color: Colors.black),),
              
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.of(context).pushNamed(addEditPostRoute, arguments: 'add');
        },
      ),
    );

  }
}