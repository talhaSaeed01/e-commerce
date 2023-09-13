// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerProvider extends ChangeNotifier {
  Future<void> addProductToFirestore(String title, String image, String price, String tileColor, String type, String circleContainerColor, String sellerId) async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference productsCollection = firestoreInstance.collection('products');
      await productsCollection
          .add({'title': title, 'price': price, 'tileColor': tileColor.toString(), 'circleContainerColor': circleContainerColor.toString(), 'image': image, 'type': type, 'sellerId': sellerId});
      print('Product data uploaded to Firestore successfully');
    } catch (e) {
      print('Error uploading product data to Firestore: $e');
    }
  }

  Future<List<DocumentSnapshot>> fetchProductsBySellerId(String sellerId) async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestoreInstance.collection('products').where('sellerId', isEqualTo: sellerId).get();
      List<DocumentSnapshot> products = querySnapshot.docs;
      return products;
    } catch (e) {
      print('Error fetching products by sellerId: $e');
      return [];
    }
  }
}
