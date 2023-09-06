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
}

class CartItem {
  String img;
  String name;
  String price;
  CartItem({required this.img, required this.name, required this.price});
}
