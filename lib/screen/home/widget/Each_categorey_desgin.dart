// ignore_for_file: must_be_immutable, file_names, prefer_typing_uninitialized_variables
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class EachCategoreyDesgin extends StatefulWidget {
  String image;
  String text;
  var id;
  EachCategoreyDesgin({super.key, required this.image, required this.text, this.id});

  @override
  State<EachCategoreyDesgin> createState() => _EachCategoreyDesginState();
}

class _EachCategoreyDesginState extends State<EachCategoreyDesgin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      CircleAvatar(backgroundColor: Appcolors.white, child: Image.asset(widget.image)),
      CaustomText(text: widget.text, color: Appcolors.black, size: 10, maxline: 1, fontWeight: FontWeight.w400)
    ]));
  }
}
