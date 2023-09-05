// ignore_for_file: camel_case_types, must_be_immutable
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class Caustom_appbar extends StatefulWidget {
  String title;
  Caustom_appbar({super.key, required this.title});

  @override
  State<Caustom_appbar> createState() => _Caustom_appbarState();
}

class _Caustom_appbarState extends State<Caustom_appbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: (() {
              Scaffold.of(context).openDrawer();
            }),
            child: Image.asset(Appassets.group)),
        CaustomText(text: widget.title, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
        Image.asset(Appassets.bell),
      ],
    );
  }
}
