import 'package:ecommerce/Authentication/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetProvider extends ChangeNotifier {
  final bool _isBottomSheetOpen = false;
  bool get isBottomSheetOpen => _isBottomSheetOpen;
  void openBottomSheet(BuildContext context) {
    notifyListeners();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(56.0))),
      builder: (BuildContext context) {
        return ChangeNotifierProvider.value(
          value: this,
          child: const BottomSheetContent(),
        );
      },
    );
    notifyListeners();
  }
}
