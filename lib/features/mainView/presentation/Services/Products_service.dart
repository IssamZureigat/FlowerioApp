// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flowerio_app/features/mainView/presentation/widgets/Models/ProudectsModels.dart';



// class ProductService {
//   final firestore = FirebaseFirestore.instance;
//   final String collection = 'Products';

//   int statusCode = 0;
//   String msg = '';

//   Future<ProductList> getProducts() async {
//     log('message');
//     QuerySnapshot querySnapshot = await firestore.collection(collection).get().catchError((e){
//       log('message2');
//       handleAuthErrors(e);
//       log('statusCode: $statusCode');
//       log('msg : $msg');
//     });
//     log('length : ${querySnapshot.docs.length}');
//     var productMap = <String,dynamic>{};
//     ProductModel productModel;
//     ProductList productList;
//     List<ProductModel> data = [];

//     for(var i in querySnapshot.docs){
//       productMap['BrandName'] = i.get('BrandName');
//       productMap['Price'] = i.get('Price');
//       productMap['image'] = i.get('image');
//       productModel = ProductModel.fromJson(productMap);
//       data.add(productModel);
//     }
//     productList =ProductList(products: data);
//     return productList;
//       }



  

// // ====================================================
//   void handleAuthErrors(ArgumentError error) {
//     String errorCode = error.message;
//     switch (errorCode) {
//       case "ABORTED":
//         {
//           statusCode = 400;
//           msg = "The operation was aborted";
//         }
//         break;
//       case "ALREADY_EXISTS":
//         {
//           statusCode = 400;
//           msg = "Some document that we attempted to create already exists.";
//         }
//         break;
//       case "CANCELLED":
//         {
//           statusCode = 400;
//           msg = "The operation was cancelled";
//         }
//         break;
//       case "DATA_LOSS":
//         {
//           statusCode = 400;
//           msg = "Unrecoverable data loss or corruption.";
//         }
//         break;
//       case "PERMISSION_DENIED":
//         {
//           statusCode = 400;
//           msg =
//               "The caller does not have permission to execute the specified operation.";
//         }
//         break;
//       default:
//         {
//           statusCode = 400;
//           msg = error.message;
//         }
//         break;
//     }
//   }
// }
