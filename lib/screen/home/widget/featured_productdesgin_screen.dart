// ignore_for_file: must_be_immutable

import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class FeaturedProductDesgin extends StatefulWidget {
  String img;
  String name;
  String price;
  FeaturedProductDesgin({super.key, required this.img, required this.name, required this.price});

  @override
  State<FeaturedProductDesgin> createState() => _FeaturedProductDesginState();
}

class _FeaturedProductDesginState extends State<FeaturedProductDesgin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: GetScreenSize.getScreenWidth(context) * 0.39,
        child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: GetScreenSize.getScreenWidth(context) * 0.49,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Appcolors.grey.withOpacity(0.46), borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage(widget.img), fit: BoxFit.fill))),
              const SizedBox(height: 3),
              CaustomText(text: widget.name, color: Appcolors.black, size: 12, maxline: 1, fontWeight: FontWeight.bold),
              CaustomText(text: widget.price, color: Appcolors.black, size: 17, maxline: 1, fontWeight: FontWeight.bold)
            ])));
  }
}
