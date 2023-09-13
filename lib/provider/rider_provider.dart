// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Riderprovider extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> fetchAllUserOrders() async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      // Reference to the 'orders' collection under 'users'
      Query<Map<String, dynamic>> ordersQuery = _firestore.collectionGroup('orders');

      // Fetch all orders from the 'orders' collection
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await ordersQuery.get();

      List<Map<String, dynamic>> allOrders = querySnapshot.docs.map((orderDoc) {
        Map<String, dynamic> orderData = orderDoc.data();
        // Extract the data you need from orderData
        String orderId = orderDoc.id;
        List<dynamic> items = orderData['items'] ?? [];
        String itemNames = items.map((item) => item['name']).join(', ');
        double totalPrice = orderData['totalPrice'] ?? 0.0;
        double subtotalPrice = orderData['subtotalPrice'] ?? 0.0;
        String status = orderData['status'] ?? '';
        String userid = orderData['userid'] ?? '';
        return {
          'orderId': orderId,
          'name': itemNames,
          'totalPrice': totalPrice,
          'subtotalPrice': subtotalPrice,
          'status': status,
          'userid': userid,
        };
      }).toList();

      return allOrders;
    } catch (e) {
      print('Error fetching all user orders: $e');
      return [];
    }
  }

  Future<void> updateOrderStatus(String orderId, String newStatus, String userId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      DocumentReference orderDocument = _firestore.collection('users').doc(userId).collection('orders').doc(orderId);

      await orderDocument.update({'status': newStatus});
      notifyListeners();
    } catch (e) {
      print('Error setting order status for order $orderId: $e');
    }
  }
}
