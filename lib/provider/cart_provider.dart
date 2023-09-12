// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartItems = [];

  void addItem(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem cartItem in cartItems) {
      double price = double.parse(cartItem.price.split("\$")[1]);
      totalPrice += price;
    }
    return totalPrice;
  }

  double calculateSubtotal() {
    double total = getTotalPrice();
    double subtotal = total + 30.0;
    return subtotal;
  }

  Future<void> sendCartDataToFirestore(String userId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      String orderID = 'order_${DateTime.now().millisecondsSinceEpoch}';
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);
      CollectionReference ordersCollection = userDocRef.collection('orders');
      List<Map<String, dynamic>> cartDataList = cartItems.map((item) {
        return {'img': item.img, 'name': item.name, 'price': item.price};
      }).toList();
      double total = getTotalPrice();
      double subtotal = calculateSubtotal();
      Map<String, dynamic> orderData = {
        'items': cartDataList,
        'totalPrice': total,
        'subtotalPrice': subtotal,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'DISPATCHED', //.................................................................................
        'userid': userId,
      };

      // Store the order data in the 'orders' subcollection using the unique order ID as the document ID
      await ordersCollection.doc(orderID).set(orderData);
      notifyListeners();
    } catch (e) {
      print('Error sending cart data to Firestore: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> fetchUserOrdersStream(String userId) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference ordersCollection = _firestore.collection('users').doc(userId).collection('orders');
    return ordersCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((orderDoc) {
        Map<String, dynamic> orderData = orderDoc.data() as Map<String, dynamic>;
        // Extract the data you need from orderData
        String orderId = orderDoc.id;
        List<dynamic> items = orderData['items'] ?? [];
        String itemNames = items.map((item) => item['name']).join(', ');
        double totalPrice = orderData['totalPrice'] ?? 0.0;
        double subtotalPrice = orderData['subtotalPrice'] ?? 0.0;
        String status = orderData['status'] ?? '';
        return {'orderId': orderId, 'name': itemNames, 'totalPrice': totalPrice, 'subtotalPrice': subtotalPrice, 'status': status};
      }).toList();
    });
  }
}

class CartItem {
  String img;
  String name;
  String price;
  CartItem({required this.img, required this.name, required this.price});
}
