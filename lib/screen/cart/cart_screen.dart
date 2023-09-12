// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screen/cart/checkout_screen1.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  var currentid;
  CartScreen({super.key, this.currentid});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.getTotalPrice();
    double subtotalPrice = cartProvider.calculateSubtotal();
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(child: CaustomText(text: Appstrings.CartScreenTitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold))),
      cartProvider.cartItems.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                Icon(Icons.not_listed_location_outlined, size: 205, color: Appcolors.discover3TileColor),
                const SizedBox(height: 3),
                CaustomText(text: Appstrings.nothingadd, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.035, fontWeight: FontWeight.w400, maxline: 1)
              ]))
          : SizedBox(
              height: GetScreenSize.getScreenWidth(context) * 0.95,
              child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 5),
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    CartItem cartItem = cartProvider.cartItems[index];
                    double priceAsDouble = double.parse(cartItem.price.split("\$")[1]);
                    return Container(
                        height: GetScreenSize.getScreenWidth(context) * 0.3,
                        decoration: BoxDecoration(color: Appcolors.white, borderRadius: const BorderRadius.all(Radius.circular(12)), boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 2)),
                        ]),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          // Container(
                          //     width: 92.66,
                          //     height: 138.86,
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(image: AssetImage(cartItem.img), fit: BoxFit.fill),
                          //     )),
                          FutureBuilder(
                              future: precacheImage(AssetImage(cartItem.img), context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const SizedBox(width: 92.66, height: 138.86, child: Center(child: CircularProgressIndicator()));
                                } else if (snapshot.hasError) {
                                  return const SizedBox(width: 92.66, height: 138.86, child: Center(child: Icon(Icons.error)));
                                } else {
                                  return Container(
                                      width: 92.66,
                                      height: 138.86,
                                      decoration: BoxDecoration(color: Appcolors.white.withOpacity(0.46), image: DecorationImage(image: NetworkImage(cartItem.img), fit: BoxFit.fill)));
                                }
                              }),
                          Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            CaustomText(text: cartItem.name, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.035, maxline: 1, fontWeight: FontWeight.bold),
                            CaustomText(text: priceAsDouble.toStringAsFixed(2), color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.043, maxline: 1, fontWeight: FontWeight.bold),
                            CaustomText(text: Appstrings.CartScreensize, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.035, maxline: 1, fontWeight: FontWeight.bold)
                          ])),
                          Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            IconButton(icon: Icon(Icons.check, color: Appcolors.green), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.delete, color: Appcolors.heartcolor),
                                onPressed: () {
                                  cartProvider.removeItem(index);
                                })
                          ])
                        ]));
                  })),
      Padding(
          padding: EdgeInsets.only(top: cartProvider.cartItems.isEmpty ? 98.0 : 27.0, left: 10, right: 10),
          child: SizedBox(
              height: GetScreenSize.getScreenWidth(context) * 0.33,
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  CaustomText(text: Appstrings.CartProductprice, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                  CaustomText(text: '\$${totalPrice.toStringAsFixed(2)}', color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                ]),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      CaustomText(text: Appstrings.CartShipping, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                      CaustomText(text: Appstrings.CartShippingamount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                    ])),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  CaustomText(text: Appstrings.CartSubtotal, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                  cartProvider.cartItems.isEmpty
                      ? CaustomText(text: '\$0', color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)
                      : CaustomText(text: '\$${subtotalPrice.toStringAsFixed(2)}', color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)
                ])
              ]))),
      GestureDetector(
          onTap: () async {
            final cartProvider = Provider.of<CartProvider>(context, listen: false);
            String _auth = FirebaseAuth.instance.currentUser!.uid;
            if (cartProvider.cartItems.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Your cart is empty. Please add items to your cart.')),
              );
            } else {
              await cartProvider.sendCartDataToFirestore(_auth);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CheckOutScreen1()), (Route<dynamic> route) => false);
              cartProvider.cartItems.clear();
            }
          },
          child: CustomTextButton(
              bordercolor: Appcolors.discover3TileColor,
              hieght: GetScreenSize.getScreenWidth(context) * 0.13,
              width: GetScreenSize.getScreenWidth(context) * 0.9,
              text: Appstrings.Proceedtocheckout,
              textcolor: Appcolors.white,
              buttoncolor: Appcolors.discover3TileColor)),
      const SizedBox(height: 5)
    ]))));
  }
}
