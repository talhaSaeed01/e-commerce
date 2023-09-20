// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls
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

  //.........................fetching order he get...........................

  Future<List<Map<String, dynamic>>> fetchOrdersBySellerId(String sellerId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      CollectionReference userOrdersCollection = _firestore.collection('orders');
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await userOrdersCollection.get() as QuerySnapshot<Map<String, dynamic>>;
      List<Map<String, dynamic>> orders = [];
      querySnapshot.docs.forEach((orderDoc) {
        Map<String, dynamic> orderData = orderDoc.data();
        String orderId = orderDoc.id;
        List<dynamic> items = orderData['items'] ?? [];
        // Filter items where the seller ID matches the specified seller ID
        List<dynamic> matchingItems = items.where((item) => item['sellerid'] == sellerId).toList();
        if (matchingItems.isNotEmpty) {
          String itemNames = matchingItems.map((item) => item['name']).join(', ');
          String itemPrice = matchingItems.map((item) => item['price']).join(', ');

          String itemimg = matchingItems.map((item) => item['img']).join(', ');
          orders.add({'orderId': orderId, 'name': itemNames, 'sellerid': sellerId, 'price': itemPrice, 'img': itemimg});
          print(itemNames.toString());
        }
      });
      print(orders.toString());
      return orders;
    } catch (e) {
      print('Error fetching orders by seller ID: $e');
      return [];
    }
  }
}
