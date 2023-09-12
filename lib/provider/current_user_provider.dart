import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? currentUserId;

  void setCurrentUserId() {
    currentUserId = FirebaseAuth.instance.currentUser!.uid;
    notifyListeners();
  }
}
