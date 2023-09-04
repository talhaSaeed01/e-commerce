import 'package:flutter/foundation.dart';

class DrawerProvider with ChangeNotifier {
  int _startValue = 15;
  int _endValue = 80;
  String selectedCountry = "United Kingdom";

  int get startValue => _startValue;
  int get endValue => _endValue;

  void setRangeValues(int start, int end) {
    _startValue = start;
    _endValue = end;
    notifyListeners();
  }

  void setSelectedCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }
}
