import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/provider/seller_provider.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerOrdersScreen extends StatelessWidget {
  final String sellerId;

  const SellerOrdersScreen({required this.sellerId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sellerOrdersProvider = Provider.of<SellerProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Appassets.riderbackgroundimage, fit: BoxFit.cover),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                    CaustomText(text: Appstrings.sellerOrderstitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                    SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.065)
                  ]),
                ),
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: sellerOrdersProvider.fetchOrdersBySellerId(
                      sellerId,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        final orders = snapshot.data ?? [];

                        if (orders.isEmpty) {
                          return Center(
                            child: Text('No orders found for this seller.'),
                          );
                        }

                        return ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Appcolors.white.withOpacity(0.49),
                                  border: Border.all(
                                    color: Appcolors.black,
                                    width: 0.6,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(child: Text('${order['orderId']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                                      Divider(
                                        color: Appcolors.black,
                                      ),
                                      const Text('Image:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                      Center(
                                        child: CachedNetworkImage(
                                            imageUrl: "${order['img']}",
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => const Icon(Icons.error)),
                                      ),
                                      Divider(
                                        color: Appcolors.black,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text('Name:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                Text(' ${order['name']}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                                                const Text('Price:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                Text('${order['price']}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 27),
                                            child: Image.asset(
                                              Appassets.shopSellerimage,
                                              height: 70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
