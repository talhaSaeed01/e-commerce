// ignore_for_file: camel_case_types, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class verticaltiledesgin extends StatefulWidget {
  String img;
  double containerHieght;
  double containerWidth;
  String title;
  String subtitle;
  Color titlecolor;
  Color subtitlecolor;
  verticaltiledesgin(
      {super.key, required this.containerHieght, required this.containerWidth, required this.title, required this.subtitle, required this.titlecolor, required this.subtitlecolor, required this.img});

  @override
  State<verticaltiledesgin> createState() => _verticaltiledesginState();
}

class _verticaltiledesginState extends State<verticaltiledesgin> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Container(
              width: widget.containerWidth,
              height: widget.containerHieght,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Appcolors.grey.withOpacity(0.15)),
              child: Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CaustomText(text: widget.title, color: widget.titlecolor, size: 12, maxline: 1, fontWeight: FontWeight.w400),
                    CaustomText(text: widget.subtitle, color: widget.subtitlecolor, size: 19, maxline: 2, fontWeight: FontWeight.bold)
                  ])))),
      Positioned(
          right: GetScreenSize.getScreenWidth(context) * 0.001,
          top: GetScreenSize.getScreenWidth(context) * 0.1,
          child: Container(
              height: GetScreenSize.getScreenWidth(context) * 0.28,
              width: GetScreenSize.getScreenWidth(context) * 0.47,
              decoration: ShapeDecoration(color: Appcolors.circlecontainercolor, shape: const CircleBorder()))),
      Positioned(
          right: GetScreenSize.getScreenWidth(context) * 0.02,
          top: GetScreenSize.getScreenWidth(context) * 0.03,
          child: CachedNetworkImage(
              imageUrl: widget.img, placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.error), fit: BoxFit.contain))
    ]);
  }
}
