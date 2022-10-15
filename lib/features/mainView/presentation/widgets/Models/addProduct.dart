






















// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';


// class PostService {
//   final _firestore = FirebaseFirestore.instance;
//   final String collectionName = 'PostData';

//   int statusCode = 0;
//   String msg = '';

//   Future<void> addPost() async {
//     await _firestore
//         .collection(collectionName)
//         .add(model.toJson())
//         .whenComplete(() {
//       log('post data added successful');
//       statusCode = 200;
//       msg = 'post data added successful';
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log('statusCode : $statusCode , error msg : $msg');
//     });
//   }

//   Future<PostList> getPosts() async {
//     QuerySnapshot querySnapshot = await _firestore
//         .collection(collectionName)
//         .orderBy('date')
//         .get()
//         .catchError((error) {
//       handleAuthErrors(error);
//       log('statusCode : $statusCode , error msg : $msg');
//     });
//     var postMap = <String, dynamic>{};
//     PostModel postModel;
//     PostList postList;
//     List<PostModel> data = [];
//     for (var item in querySnapshot.docs) {
//       postMap['id'] = item.get('id');
//       postMap['title'] = item.get('title');
//       postMap['subtitle'] = item.get('subtitle');
//       postMap['image'] = item.get('image');
//       postMap['date'] = item.get('date');
//       postModel = PostModel.fromJson(postMap);
//       data.add(postModel);
//     }
//     postList = PostList(posts: data);
//     return postList;
//   }

//   Future<PostModel> getPostById(String id) async {
//     QuerySnapshot querySnapshot = await _firestore
//         .collection(collectionName)
//         .where('id', isEqualTo: id)
//         .get()
//         .catchError((error) {
//       handleAuthErrors(error);
//       log('statusCode : $statusCode , error msg : $msg');
//     });
//     var postMap = <String, dynamic>{};
//     PostModel postModel;
//     postMap['id'] = querySnapshot.docs[0].get('id');
//     postMap['title'] = querySnapshot.docs[0].get('title');
//     postMap['subtitle'] = querySnapshot.docs[0].get('subtitle');
//     postMap['image'] = querySnapshot.docs[0].get('image');
//     postMap['date'] = querySnapshot.docs[0].get('date');
//     postModel = PostModel.fromJson(postMap);
//     return postModel;
//   }

//   Future<void> updatePost(String id, PostModel model) async {
//     QuerySnapshot querySnapshot = await _firestore
//         .collection(collectionName)
//         .where('id', isEqualTo: id)
//         .get();
//     String documentId = querySnapshot.docs[0].id;
//     await _firestore
//         .collection(collectionName)
//         .doc(documentId)
//         .update(model.toJson())
//         .whenComplete(() {
//       log('post data updated successful');
//       statusCode = 200;
//       msg = 'post data updated successful';
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log('statusCode : $statusCode , error msg : $msg');
//     });
//   }

//   Future<void> deletePost(String id) async {
//     QuerySnapshot querySnapshot = await _firestore
//         .collection(collectionName)
//         .where('id', isEqualTo: id)
//         .get();
//     String documentId = querySnapshot.docs[0].id;
//     await _firestore
//         .collection(collectionName)
//         .doc(documentId)
//         .delete()
//         .whenComplete(() {
//       log('post data deleted successful');
//       statusCode = 200;
//       msg = 'post data deleted successful';
//     }).catchError((error) {
//       handleAuthErrors(error);
//       log('statusCode : $statusCode , error msg : $msg');
//     });
//   }

//   //=====================================================================

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
