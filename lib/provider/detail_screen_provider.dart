import 'package:flutter/material.dart';

class DetailScreenProvider extends ChangeNotifier {
  int _rating = 0;
  int get rating => _rating;
  void setRating(int value) {
    _rating = value;
    notifyListeners();
  }
}
