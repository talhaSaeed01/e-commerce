// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screen/bottonavbar_screen.dart';
import 'package:ecommerce/seller/sellerscreen.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  // Constructor to initialize the user when the provider is created.
  AuthProvider() {
    _user = _auth.currentUser;
  }
  User? get user => _user;
  // Function to handle user logout.
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

// Function to handle user Signup.
  Future<void> signUp(String name, String email, String password, String confirmPassword, bool isSeller, BuildContext context) async {
    try {
      if (name.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty || confirmPassword.trim().isEmpty) {
        showSnackBar(context, 'Enter all the details');
      } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
        showSnackBar(context, 'Enter a valid name');
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
        showSnackBar(context, 'Enter a valid email');
      } else if (!RegExp(r'^.{8,}$').hasMatch(password)) {
        showSnackBar(context, 'Password must be at least 8 characters');
      } else if (password != confirmPassword) {
        showSnackBar(context, 'Passwords do not match');
      } else {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          final role = isSeller ? 'seller' : 'user';
          await _firestore.collection("SignUp").doc(userCredential.user!.uid).set({'name': name, 'email': email, 'password': password, 'role': role});
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Bottomnavbardesgin(userid: userCredential.user!.uid)), (Route<dynamic> route) => false);
          if (isSeller) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SellerScreen(userid: userCredential.user!.uid)));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Bottomnavbardesgin(userid: userCredential.user!.uid)));
          }
        }
      }
    } catch (e) {
      print('Error signing up: $e');
      showSnackBar(context, 'Error signing up: $e');
    }
  }

//Funcation to show snackbar
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(action: SnackBarAction(label: 'Done', textColor: Appcolors.white, onPressed: () {}), content: Text(message, style: TextStyle(fontWeight: FontWeight.bold, color: Appcolors.white))));
  }

//Funcation to show signin
  // Future<void> signIn(String email, String password, BuildContext context) async {
  //   try {
  //     if (email.trim().isEmpty || password.trim().isEmpty) {
  //       showSnackBar(context, 'Enter email and password');
  //     } else {
  //       final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //       if (userCredential.user != null) {
  //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Bottomnavbardesgin(userid: userCredential.user!.uid)), (Route<dynamic> route) => false);
  //       }
  //     }
  //   } catch (e) {
  //     print('Error signing in: $e');
  //     showSnackBar(context, 'Error signing in: $e');
  //   }
  // }
  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      if (email.trim().isEmpty || password.trim().isEmpty) {
        showSnackBar(context, 'Enter email and password');
      } else {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          final userDoc = await _firestore.collection("SignUp").doc(userCredential.user!.uid).get();
          final role = userDoc['role'];
          if (role == 'seller') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SellerScreen(userid: userCredential.user!.uid)));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Bottomnavbardesgin(userid: userCredential.user!.uid)));
          }
        }
      }
    } catch (e) {
      print('Error signing in: $e');
      showSnackBar(context, 'Error signing in: $e');
    }
  }
}
