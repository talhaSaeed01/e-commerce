// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:ecommerce/class/product_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> uploadDataToFirestore(List<Product> products) async {
  try {
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference productsCollection = firestoreInstance.collection('products');
    for (var product in products) {
      await productsCollection.add({
        'sellerId': product.sellerId,
        'title': product.title,
        'price': product.price,
        'tileColor': product.tileColor.toString(),
        'circleContainerColor': product.circleContainerColor.toString(),
        'image': product.image,
        'type': product.type
      });
    }
    print('Data uploaded to Firestore successfully');
  } catch (e) {
    print('Error uploading data to Firestore: $e');
  }
}

Future<List<Product>> fetchProductsFromFirestore() async {
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference productsCollection = firestoreInstance.collection('products');
  try {
    QuerySnapshot querySnapshot = await productsCollection.get();
    List<Product> productList = [];
    querySnapshot.docs.forEach((document) {
      productList.add(Product(document['title'], document['price'], Color(int.parse(document['tileColor'].split('(0x')[1].split(')')[0], radix: 16)),
          Color(int.parse(document['circleContainerColor'].split('(0x')[1].split(')')[0], radix: 16)), document['image'], document['type'], document['sellerId']));
    });
    return productList;
  } catch (e) {
    print('Error fetching data from Firestore: $e');
    return [];
  }
}
