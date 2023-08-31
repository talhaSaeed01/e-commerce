import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class CaustomSearchbar extends StatefulWidget {
  const CaustomSearchbar({super.key});

  @override
  State<CaustomSearchbar> createState() => _CaustomSearchbarState();
}

class _CaustomSearchbarState extends State<CaustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: GetScreenSize.getScreenWidth(context) * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Appcolors.grey.withOpacity(0.13)),
          child: Row(children: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: Appstrings.discoverappbarhint)))
          ])),
      Container(
          width: GetScreenSize.getScreenWidth(context) * 0.15,
          height: 49,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: ShapeDecoration(
              color: Appcolors.grey.withOpacity(0.13), image: DecorationImage(image: AssetImage(Appassets.filter)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))))
    ]);
  }
}
