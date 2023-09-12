// ignore_for_file: must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class CustomOCimage extends StatefulWidget {
  String image;
  CustomOCimage({super.key, required this.image});

  @override
  State<CustomOCimage> createState() => _CustomOCimageState();
}

class _CustomOCimageState extends State<CustomOCimage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: GetScreenSize.getScreenWidth(context) * 0.68,
        height: GetScreenSize.getScreenWidth(context) * 1,
        decoration: ShapeDecoration(color: Appcolors.caustomOCimage, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, top: 10),
            child: CachedNetworkImage(
                imageUrl: widget.image, placeholder: (context, url) => const CircularProgressIndicator(), errorWidget: (context, url, error) => const Icon(Icons.error), fit: BoxFit.contain)));
  }
}
