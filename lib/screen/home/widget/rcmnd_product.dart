// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class RcmndProductScreen extends StatefulWidget {
  String img;
  String price;
  String title;
  RcmndProductScreen({super.key, required this.img, required this.title, required this.price});

  @override
  State<RcmndProductScreen> createState() => _RcmndProductScreenState();
}

class _RcmndProductScreenState extends State<RcmndProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: GetScreenSize.getScreenWidth(context) * 0.73,
        decoration: BoxDecoration(color: Appcolors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(15)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              width: GetScreenSize.getScreenWidth(context) * 0.26,
              height: GetScreenSize.getScreenWidth(context) * 0.27,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: CachedNetworkImageProvider(widget.img), fit: BoxFit.fill))),
          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
            CaustomText(text: widget.title, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold),
            CaustomText(text: widget.price, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold)
          ])
        ]));
  }
}
