import 'package:ecommerce/firebase/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/class/product_class.dart';

class Productprovider extends ChangeNotifier {
  List<Product> featuredproductslist = [];
  List<Product> recomendedproductslist = [];
  List<Product> discoverproductslist = [];
  List<Product> popularproductslist = [];
  Product? twobannerProduct;
  Product? firstbannerProduct;
  Product? thirdbannerProduct;
  Product? fourthbannerProduct;
  Product? fifthbannerProduct;
  Product? sixbannerProduct;
  Future<void> fetchAndSetProductsFromFirestore() async {
    try {
      final productList = await fetchProductsFromFirestore();
      featuredproductslist = productList.where((element) => element.type == 'featuredProducts').toList();
      recomendedproductslist = productList.where((element) => element.type == "recomendedProducts").toList();
      discoverproductslist = productList.where((element) => element.type == "discoverProducts").toList();
      popularproductslist = productList.where((element) => element.type == "popularProducts").toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching data from Firestore: $e');
    }
  }

  Future<Product?> fetchsecondbannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      twobannerProduct = productList.firstWhere(
        (element) => element.type == 'twobanner',
      );
      notifyListeners();
      return twobannerProduct;
    } catch (e) {
      print('Error fetching "other" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }

  Future<Product?> fetchFirstBannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      firstbannerProduct = productList.firstWhere(
        (element) => element.type == 'firstBanner',
      );
      notifyListeners();
      return firstbannerProduct;
    } catch (e) {
      print('Error fetching "firstBanner" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }

  Future<Product?> fetchThirdBannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      thirdbannerProduct = productList.firstWhere(
        (element) => element.type == 'thirdBanner',
      );
      notifyListeners();
      return thirdbannerProduct;
    } catch (e) {
      print('Error fetching "thirdBanner" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }

  Future<Product?> fetchFourthBannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      fourthbannerProduct = productList.firstWhere(
        (element) => element.type == 'fourthBanner',
      );
      notifyListeners();
      return fourthbannerProduct;
    } catch (e) {
      print('Error fetching "fourthBanner" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }

  Future<Product?> fetchFifthBannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      fifthbannerProduct = productList.firstWhere(
        (element) => element.type == 'fifthBanner',
      );
      notifyListeners();
      print(fifthbannerProduct.toString());
      return fifthbannerProduct;
    } catch (e) {
      print('Error fetching "fifthBanner" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }

  Future<Product?> fetchSixBannerProduct() async {
    try {
      final productList = await fetchProductsFromFirestore();
      sixbannerProduct = productList.firstWhere(
        (element) => element.type == 'sixBanner',
      );
      notifyListeners();
      return sixbannerProduct;
    } catch (e) {
      print('Error fetching "sixBanner" product from Firestore: $e');
      notifyListeners();
      return null;
    }
  }
}
