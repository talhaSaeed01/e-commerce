// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:ecommerce/Authentication/signin_screen.dart';
import 'package:ecommerce/provider/fire_base_authprovider.dart';
import 'package:ecommerce/provider/seller_provider.dart';
import 'package:ecommerce/seller/seller_order_Screen.dart';
import 'package:ecommerce/seller/seller_product_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerScreen extends StatefulWidget {
  var userid;
  SellerScreen({super.key, required this.userid});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  final TextEditingController circleContainerColorController = TextEditingController();
  final TextEditingController imageurlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController tileColorController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var selleruniqueId = FirebaseAuth.instance.currentUser!.uid;
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Image.asset(Appassets.riderbackgroundimage, fit: BoxFit.cover, width: double.infinity),
      GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                        width: GetScreenSize.getScreenWidth(context) * 0.095,
                        child: Material(
                            elevation: 4.0,
                            shape: const CircleBorder(),
                            shadowColor: Appcolors.black,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SellerProductsScreen(sellerId: selleruniqueId),
                                  )),
                              child: CircleAvatar(
                                  backgroundColor: Appcolors.white, child: Padding(padding: const EdgeInsets.only(left: 1), child: Icon(Icons.dashboard_customize_outlined, color: Appcolors.black))),
                            ))),
                    SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.17),
                    Expanded(
                        child: CaustomText(text: Appstrings.sellerScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold)),
                    GestureDetector(
                        onTap: () {
                          // authProvider.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SellerOrdersScreen(sellerId: selleruniqueId)));
                        },
                        child: Material(
                            elevation: 4.0,
                            shape: const CircleBorder(),
                            shadowColor: Appcolors.black,
                            child: CircleAvatar(backgroundColor: Appcolors.white, child: Padding(padding: const EdgeInsets.only(left: 1), child: Icon(Icons.shopping_bag, color: Appcolors.black))))),
                    SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.02),
                    GestureDetector(
                        onTap: () {
                          authProvider.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Signin()));
                        },
                        child: Material(
                            elevation: 4.0,
                            shape: const CircleBorder(),
                            shadowColor: Appcolors.black,
                            child: CircleAvatar(backgroundColor: Appcolors.white, child: Padding(padding: const EdgeInsets.only(left: 1), child: Icon(Icons.logout, color: Appcolors.black))))),
                  ])),
              Image.asset(Appassets.shopSellerimage, scale: 5),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 20),
                  child: CustomTextField(controller: titleController, hinttext: Appstrings.titleController, keyboardfoam: TextInputType.name)),
              Padding(padding: const EdgeInsets.all(8.0), child: CustomTextField(controller: imageurlController, hinttext: Appstrings.imageurlController, keyboardfoam: TextInputType.emailAddress)),
              Padding(padding: const EdgeInsets.all(8.0), child: CustomTextField(controller: priceController, hinttext: Appstrings.priceController, keyboardfoam: TextInputType.visiblePassword)),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 10),
                  child: CustomTextField(controller: tileColorController, hinttext: Appstrings.tileColorController, keyboardfoam: TextInputType.visiblePassword)),
              Padding(padding: const EdgeInsets.all(6.0), child: CustomTextField(controller: typeController, hinttext: Appstrings.typeController, keyboardfoam: TextInputType.visiblePassword)),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CustomTextField(controller: circleContainerColorController, hinttext: Appstrings.circleContainerColorController, keyboardfoam: TextInputType.visiblePassword)),
              Padding(
                  padding: const EdgeInsets.all(29.0),
                  child: GestureDetector(
                    onTap: () {
                      var sellerId = FirebaseAuth.instance.currentUser!.uid;
                      final sellerProvider = Provider.of<SellerProvider>(context, listen: false);
                      sellerProvider.addProductToFirestore(
                          titleController.text, imageurlController.text, priceController.text, tileColorController.text, typeController.text, circleContainerColorController.text, sellerId);
                      titleController.clear();
                      imageurlController.clear();
                      priceController.clear();
                      tileColorController.clear();
                      typeController.clear();
                      circleContainerColorController.clear();
                    },
                    child: CustomTextButton(
                        bordercolor: Appcolors.white,
                        hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                        width: GetScreenSize.getScreenWidth(context) * 0.8,
                        text: Appstrings.done,
                        textcolor: Appcolors.white,
                        buttoncolor: Appcolors.browncolorbutton),
                  ))
            ]),
          )))
    ])));
  }
}
