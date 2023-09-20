// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/class/drawer_color.dart';
import 'package:ecommerce/class/size_class.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/detail_screen_provider.dart';
import 'package:ecommerce/screen/cart/cart_screen.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';

class DetailScreen extends StatefulWidget {
  String img;
  String name;
  String price;
  String sellerId;
  DetailScreen({super.key, required this.img, required this.name, required this.price, required this.sellerId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<DetailScreenProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(children: [
                SizedBox(
                    width: double.infinity,
                    height: GetScreenSize.getScreenWidth(context) * 0.7,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 68, bottom: 10, left: 22),
                        child: Container(height: GetScreenSize.getScreenWidth(context) * 0.12, decoration: ShapeDecoration(color: Appcolors.grey.withOpacity(0.15), shape: const CircleBorder())))),
                Positioned(
                    left: 95,
                    top: GetScreenSize.getScreenWidth(context) * 0.02,
                    child: SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.7,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    elevation: 10,
                                    content: SizedBox(
                                        width: GetScreenSize.getScreenWidth(context) * 0.85,
                                        height: GetScreenSize.getScreenWidth(context) * 0.7,
                                        child: PhotoView(
                                            imageProvider: CachedNetworkImageProvider(widget.img),
                                            minScale: PhotoViewComputedScale.contained,
                                            maxScale: PhotoViewComputedScale.covered * 1,
                                            backgroundDecoration: BoxDecoration(color: Appcolors.white))));
                              },
                            );
                          },
                          child: CachedNetworkImage(
                              imageUrl: widget.img, placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.error), fit: BoxFit.fill),
                        ))),
                Positioned(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                          Material(
                              elevation: 4.0,
                              shape: const CircleBorder(),
                              shadowColor: Appcolors.black,
                              child: CircleAvatar(backgroundColor: Appcolors.white, child: Padding(padding: const EdgeInsets.only(left: 6), child: Icon(Icons.favorite, color: Appcolors.heartcolor))))
                        ])))
              ]),
              Container(
                  decoration: BoxDecoration(
                      color: Appcolors.white,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 2))]),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 14, right: 14),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          CaustomText(text: widget.name, color: Appcolors.black, size: 17, maxline: 1, fontWeight: FontWeight.bold),
                          CaustomText(text: widget.price, color: Appcolors.black, size: 24, maxline: 1, fontWeight: FontWeight.bold)
                        ]),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(5, (index) {
                                  return GestureDetector(
                                      onTap: () {
                                        detailProvider.setRating(index + 1);
                                      },
                                      child: Icon(Icons.star, color: Provider.of<DetailScreenProvider>(context).rating >= index + 1 ? Appcolors.starcolorblue : Appcolors.grey));
                                }))),
                        const Divider(),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          SizedBox(
                              height: GetScreenSize.getScreenWidth(context) * 0.22,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                CaustomText(text: Appstrings.drawercolor, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w400),
                                SizedBox(
                                    height: GetScreenSize.getScreenWidth(context) * 0.12,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => CircleAvatar(backgroundColor: drawerColors[index].color, radius: 12),
                                        separatorBuilder: (context, index) => const SizedBox(width: 6),
                                        itemCount: drawerColors.length))
                              ])),
                          SizedBox(
                              height: GetScreenSize.getScreenWidth(context) * 0.2,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                CaustomText(text: Appstrings.detailsize, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w400),
                                SizedBox(
                                    height: GetScreenSize.getScreenWidth(context) * 0.12,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => Material(
                                            elevation: 4.0,
                                            shape: const CircleBorder(),
                                            shadowColor: Appcolors.black,
                                            child: CircleAvatar(
                                                radius: 17,
                                                backgroundColor: Appcolors.grey.withOpacity(0.1),
                                                child: Padding(padding: const EdgeInsets.only(left: 0), child: Text(sizeList[index].name, style: TextStyle(color: Appcolors.black))))),
                                        separatorBuilder: (context, index) => const SizedBox(width: 6),
                                        itemCount: sizeList.length))
                              ]))
                        ]),
                        const Divider(),
                        CaustomText(text: Appstrings.description, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child:
                                CaustomText(text: Appstrings.descriptiondetail, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.032, maxline: 4, fontWeight: FontWeight.w300)),
                        const Divider(),
                        CaustomText(text: Appstrings.descriptionreview, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                        const Divider(),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          SizedBox(
                              child: Row(children: [
                            CaustomText(text: Appstrings.ratingpoint, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.09, maxline: 1, fontWeight: FontWeight.bold),
                            const SizedBox(width: 7),
                            CaustomText(text: Appstrings.ratingpointoutof, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.03, maxline: 1, fontWeight: FontWeight.bold)
                          ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                    onTap: () {
                                      detailProvider.setRating(index + 1);
                                    },
                                    child: Icon(Icons.star, color: Provider.of<DetailScreenProvider>(context).rating >= index + 1 ? Appcolors.starcolorblue : Appcolors.grey));
                              }))
                        ]),
                        ListView.separated(
                            shrinkWrap: true,
                            itemCount: 5,
                            separatorBuilder: (context, index) => const SizedBox(height: 20.0),
                            itemBuilder: (context, index) {
                              double progress = (index + 1) * 20.0;
                              Color progressColor = Appcolors.blue;
                              String roundedProgress = progress.toStringAsFixed(0);
                              return Row(children: [
                                Icon(Icons.star, color: Appcolors.starcolorblue),
                                const SizedBox(width: 8.0),
                                Expanded(
                                    child: LinearProgressIndicator(backgroundColor: Appcolors.discover4TileColor, valueColor: AlwaysStoppedAnimation<Color>(progressColor), value: progress / 100.0)),
                                const SizedBox(width: 8.0),
                                Text('$roundedProgress%', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
                              ]);
                            }),
                        Container(height: 34)
                      ])))
            ])),
            bottomNavigationBar: GestureDetector(
                onTap: () {
                  CartItem cartItem = CartItem(img: widget.img, name: widget.name, price: widget.price, sellerId: widget.sellerId);
                  cartProvider.addItem(cartItem);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Appcolors.boxcoloronboarding,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
                        boxShadow: [BoxShadow(color: Appcolors.discover3TileColor, spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 2))]),
                    width: double.infinity,
                    height: 60,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(Icons.shop, color: Appcolors.white, size: 14),
                        CaustomText(text: Appstrings.addtocart, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.035, maxline: 1, fontWeight: FontWeight.bold)
                      ]),
                      const SizedBox(height: 8),
                      Divider(indent: 130, endIndent: 130, height: 5, thickness: 3, color: Appcolors.grey)
                    ])))));
  }
}
