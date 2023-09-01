import 'package:ecommerce/class/product_class.dart';
import 'package:flutter/material.dart';

class Productprovider extends ChangeNotifier {
  List<Product> featuredproductslist = [];
  List<Product> recomendedproductslist = [];
  List<Product> discoverproductslist = [];
  List<Product> popularproductslist = [];

  void addfeaturedProducts() {
    featuredproductslist = products.where((element) => element.type == 'featuredProducts').toList();
    notifyListeners();
  }

  void addrecomendedProducts() {
    recomendedproductslist = products.where((element) => element.type == "recomendedProducts").toList();
    notifyListeners();
  }

  void adddiscoverProducts() {
    discoverproductslist = products.where((element) => element.type == "discoverProducts").toList();
    notifyListeners();
  }

  void addpopularProducts() {
    popularproductslist = products.where((element) => element.type == "popularProducts").toList();
    notifyListeners();
  }
}
