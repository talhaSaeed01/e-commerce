// ignore_for_file: must_be_immutable

import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class CaustomHeading extends StatefulWidget {
  String lefttext;
  Color lefttextcolor;
  double lefttextsize;
  FontWeight leftfontwieght;
  String righttext;
  Color righttextcolor;
  double rightttextsize;
  FontWeight righttfontwieght;
  CaustomHeading(
      {super.key,
      required this.lefttext,
      required this.lefttextcolor,
      required this.lefttextsize,
      required this.leftfontwieght,
      required this.righttext,
      required this.righttextcolor,
      required this.rightttextsize,
      required this.righttfontwieght});

  @override
  State<CaustomHeading> createState() => _CaustomHeadingState();
}

class _CaustomHeadingState extends State<CaustomHeading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CaustomText(text: widget.lefttext, color: widget.lefttextcolor, size: widget.lefttextsize, maxline: 1, fontWeight: widget.leftfontwieght),
        CaustomText(text: widget.righttext, color: widget.righttextcolor, size: widget.rightttextsize, maxline: 1, fontWeight: widget.righttfontwieght),
      ],
    );
  }
}
