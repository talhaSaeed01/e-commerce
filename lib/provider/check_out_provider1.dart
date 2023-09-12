import 'package:flutter/material.dart';

class CheckoutProvider1 extends ChangeNotifier {
  int selectedTileIndex = -1;
  bool isCheckboxChecked = false;

  void setSelectedTileIndex(int index) {
    selectedTileIndex = index;
    notifyListeners();
  }

//.................................checkbox....................
  void toggleCheckbox(bool newValue) {
    isCheckboxChecked = newValue;
    notifyListeners();
  }
}
