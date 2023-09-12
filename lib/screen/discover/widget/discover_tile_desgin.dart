// ignore_for_file: camel_case_types, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class discovertiledesgin extends StatefulWidget {
  String img;
  double containerHieght;
  double containerWidth;
  String title;
  Color tilecolor;
  Color circlecolor;
  discovertiledesgin({super.key, required this.containerHieght, required this.containerWidth, required this.title, required this.tilecolor, required this.img, required this.circlecolor});

  @override
  State<discovertiledesgin> createState() => _discovertiledesginState();
}

class _discovertiledesginState extends State<discovertiledesgin> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Container(
              width: widget.containerWidth,
              height: widget.containerHieght,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: widget.tilecolor.withOpacity(0.45)),
              child: Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CaustomText(text: widget.title, color: Appcolors.black, size: 23, maxline: 1, fontWeight: FontWeight.bold),
                  ])))),
      Positioned(
          right: GetScreenSize.getScreenWidth(context) * 0.08,
          top: GetScreenSize.getScreenWidth(context) * 0.12,
          child: Container(
              height: GetScreenSize.getScreenWidth(context) * 0.28,
              width: GetScreenSize.getScreenWidth(context) * 0.47,
              decoration: ShapeDecoration(color: widget.circlecolor, shape: const CircleBorder()))),
      Positioned(
          right: GetScreenSize.getScreenWidth(context) * 0.045,
          top: GetScreenSize.getScreenWidth(context) * 0.071,
          child: Container(
              height: GetScreenSize.getScreenWidth(context) * 0.38,
              width: GetScreenSize.getScreenWidth(context) * 0.55,
              decoration: ShapeDecoration(color: widget.circlecolor.withOpacity(0.65), shape: const CircleBorder()))),
      Positioned(
          right: GetScreenSize.getScreenWidth(context) * 0.16,
          top: GetScreenSize.getScreenWidth(context) * 0.032,
          child: CachedNetworkImage(
              imageUrl: widget.img, placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.error), fit: BoxFit.fill))
    ]);
  }
}
