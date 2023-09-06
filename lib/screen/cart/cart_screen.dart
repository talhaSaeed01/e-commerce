import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screen/cart/checkout_screen1.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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
          child: Center(child: CaustomText(text: Appstrings.CartScreenTitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold)),
        ),
        cartProvider.cartItems.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(37.0),
                child: Column(children: [
                  Icon(Icons.not_listed_location_outlined, size: 205, color: Appcolors.discover3TileColor),
                  const SizedBox(height: 8),
                  CaustomText(text: Appstrings.nothingadd, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.035, fontWeight: FontWeight.w400, maxline: 1)
                ]))
            : SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.97,
                child: ListView.separated(
                    padding: const EdgeInsets.all(5),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      CartItem cartItem = cartProvider.cartItems[index];

                      // int priceAsInt = int.parse(cartItem.price.split("\$")[1]);
                      double priceAsDouble = double.parse(cartItem.price.split("\$")[1]);

                      return Container(
                          height: GetScreenSize.getScreenWidth(context) * 0.3,
                          decoration: BoxDecoration(color: Appcolors.white, borderRadius: const BorderRadius.all(Radius.circular(12)), boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 2)),
                          ]),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                            Container(
                                width: 92.66,
                                height: 138.86,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(cartItem.img), fit: BoxFit.fill),
                                )),
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
                                  }),
                            ])
                          ]));
                    })),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.5,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CaustomText(text: Appstrings.CartProductprice, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                    CaustomText(text: '\$${totalPrice.toStringAsFixed(2)}', color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CaustomText(text: Appstrings.CartShipping, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                    CaustomText(text: Appstrings.CartShippingamount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CaustomText(text: Appstrings.CartSubtotal, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                    CaustomText(text: '\$${subtotalPrice.toStringAsFixed(2)}', color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)
                  ])
                ]))),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen1())),
          child: CustomTextButton(
              bordercolor: Appcolors.discover3TileColor,
              hieght: GetScreenSize.getScreenWidth(context) * 0.13,
              width: GetScreenSize.getScreenWidth(context) * 0.9,
              text: Appstrings.Proceedtocheckout,
              textcolor: Appcolors.white,
              buttoncolor: Appcolors.discover3TileColor),
        ),
        const SizedBox(height: 5)
      ]),
    )));
  }
}
