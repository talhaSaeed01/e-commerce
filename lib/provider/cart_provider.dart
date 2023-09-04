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
}

class CartItem {
  String img;
  String name;
  String price;
  CartItem({required this.img, required this.name, required this.price});
}
