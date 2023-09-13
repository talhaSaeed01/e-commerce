import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/provider/seller_provider.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerProductsScreen extends StatelessWidget {
  final String sellerId;

  const SellerProductsScreen({super.key, required this.sellerId});

  @override
  Widget build(BuildContext context) {
    final sellerProvider = Provider.of<SellerProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Positioned.fill(child: Image.asset(Appassets.riderbackgroundimage, fit: BoxFit.cover)),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
              CaustomText(text: Appstrings.sellerScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
              SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
            ])),
        Expanded(
            child: FutureBuilder<List<DocumentSnapshot>>(
                future: sellerProvider.fetchProductsBySellerId(sellerId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found for this seller.'));
                  } else {
                    final products = snapshot.data!;
                    return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 9),
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index].data() as Map<String, dynamic>;
                          return Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Appcolors.white.withOpacity(0.44)),
                              child: Stack(children: [
                                Positioned(
                                    bottom: 1,
                                    right: 1,
                                    left: 130,
                                    child: SizedBox(
                                        height: GetScreenSize.getScreenWidth(context) * 0.33,
                                        child: CachedNetworkImage(
                                            imageUrl: product['image'],
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                            fit: BoxFit.fill))),
                                Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Center(child: Text("Product", style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.051, fontWeight: FontWeight.bold))),
                                      const Divider(thickness: 1),
                                      Text('Product Name:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                      Text(product['title']),
                                      Text('Product Price:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                      Text(product['price']),
                                      Text('Product Type:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                      Text(product['type']),
                                      Text('Product TileColor: ', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                      Text(product['tileColor']),
                                      Text('Product CircleColor:', style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.041, fontWeight: FontWeight.bold)),
                                      Text(product['circleContainerColor'])
                                    ]))
                              ]));
                        });
                  }
                }))
      ])
    ])));
  }
}
