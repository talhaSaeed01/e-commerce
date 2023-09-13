// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/screen/home/widget/msg_desgin.dart';

class NotificaionScreen extends StatefulWidget {
  var currentuserid;
  NotificaionScreen({super.key, this.currentuserid});

  @override
  State<NotificaionScreen> createState() => _NotificaionScreenState();
}

class _NotificaionScreenState extends State<NotificaionScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8, top: 9),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                        CaustomText(text: Appstrings.CheckOutScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                        SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
                      ]),
                      Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                              stream: cartProvider.fetchUserOrdersStream(widget.currentuserid),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return const Center(child: Column(children: [Icon(Icons.not_listed_location_outlined), Text('No orders from you.')]));
                                } else {
                                  List<Map<String, dynamic>> userOrderList = snapshot.data!;
                                  return ListView.separated(
                                      reverse: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      itemCount: userOrderList.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> orderData = userOrderList[index];
                                        String orderId = orderData['orderId'];
                                        String name = orderData['name'];
                                        double totalPrice = orderData['totalPrice'];
                                        double subtotalPrice = orderData['subtotalPrice'];
                                        String status = orderData['status'];
                                        return Container(
                                            width: double.infinity,
                                            decoration: ShapeDecoration(
                                                color: Appcolors.white,
                                                shape: RoundedRectangleBorder(side: BorderSide(width: 0.50, color: Appcolors.white), borderRadius: BorderRadius.circular(15)),
                                                shadows: const [BoxShadow(color: Color(0x330E0E0E), blurRadius: 13, offset: Offset(0, 4), spreadRadius: -8)]),
                                            child: Column(children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    Text('Your order id is $orderId', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                    Text(
                                                        'Thank you for shopping. Your order of $name with an amount of \$${totalPrice.toStringAsFixed(2)} has been placed. \$30 included for delivery. Total amount is \$${subtotalPrice.toStringAsFixed(2)}\nOrder status: $status'),
                                                    Container(color: Appcolors.white)
                                                  ]))
                                            ]));
                                      });
                                }
                              })),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                          child: Column(children: [
                            MsgDesgin(title: Appstrings.notititle1, subtitle: Appstrings.notisubtitle1),
                            Padding(padding: const EdgeInsets.only(top: 13, bottom: 12), child: MsgDesgin(title: Appstrings.notititle2, subtitle: Appstrings.notisubtitle2)),
                            MsgDesgin(title: Appstrings.notititle3, subtitle: Appstrings.notisubtitle3),
                          ]))
                    ])))));
  }
}
