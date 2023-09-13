import 'package:ecommerce/provider/rider_provider.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class RiderPannel extends StatefulWidget {
  const RiderPannel({super.key});

  @override
  State<RiderPannel> createState() => _RiderPannelState();
}

class _RiderPannelState extends State<RiderPannel> {
  final Riderprovider _adminProvider = Riderprovider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Positioned.fill(child: Image.asset(Appassets.riderbackgroundimage, fit: BoxFit.cover)),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
            CaustomText(text: Appstrings.riderscreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold),
            SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.095)
          ])),
      Padding(
          padding: EdgeInsets.only(top: GetScreenSize.getScreenWidth(context) * 0.16),
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _adminProvider.fetchAllUserOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No orders found.'));
                } else {
                  List<Map<String, dynamic>> orders = List<Map<String, dynamic>>.from(snapshot.data!);
                  return ListView.separated(
                      padding: const EdgeInsets.all(15),
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Appcolors.white),
                            child: Stack(children: [
                              Positioned(bottom: 1, right: 1, left: 110, child: Image.asset(Appassets.riderimage)),
                              Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Center(child: Text("Order Detail", style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.051, fontWeight: FontWeight.bold))),
                                    const Divider(thickness: 1),
                                    Text('Order ID:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text('${orders[index]['orderId']}'),
                                    Text('Caustomer ID:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text(' ${orders[index]['userid']}'),
                                    Text('Items Name:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text('${orders[index]['name']}'),
                                    Text('Total Price: ', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text('\$${orders[index]['totalPrice']}'),
                                    Text('Subtotal Price: ', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text('\$${orders[index]['subtotalPrice'].toStringAsFixed(2)}'),
                                    Text('Status', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                    Text('${orders[index]['status']}'),
                                    // Image.asset(Appassets.riderimage, alignment: Alignment.centerRight),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: GestureDetector(
                                            onTap: () {
                                              _adminProvider.updateOrderStatus(orders[index]['orderId'], 'Delivered', orders[index]['userid']);
                                            },
                                            child: CustomTextButton(
                                                hieght: GetScreenSize.getScreenWidth(context) * 0.12,
                                                width: GetScreenSize.getScreenWidth(context) * 0.35,
                                                text: "Delivered",
                                                textcolor: Appcolors.white,
                                                buttoncolor: Appcolors.boxcoloronboarding,
                                                bordercolor: Appcolors.white)))
                                  ]))
                            ]));
                      });
                }
              }))
    ])));
  }
}
