import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../Model/Products.dart';

class ProductServices {
  // upload each images to firebase storage
  Future<String?> uploadImage(File imageFile) async {
    try {
      //if image is large and error occurs error e is printed or displayed
      final path = 'products/${DateTime.now()}.png';
      // image name is stored as current datetime.png

      final file = File(imageFile.path);
      //File(imageFile.path) access the local path4

      final ref = firebase_storage.FirebaseStorage.instance.ref().child(path);
      await ref.putFile(file);
      // upload file to ref

      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> createProduct(Products product) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .add(product.toJson());
    } catch (e) {
      print(e);
    }
  }
}
