// ignore_for_file: must_be_immutable

import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  double width;
  double hieght;
  String text;
  Color textcolor;
  Color buttoncolor;
  Color bordercolor;
  CustomTextButton({super.key, required this.hieght, required this.width, required this.text, required this.textcolor, required this.buttoncolor, required this.bordercolor});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            width: widget.width,
            height: widget.hieght,
            child: Container(
                decoration:
                    ShapeDecoration(color: widget.buttoncolor, shape: RoundedRectangleBorder(side: BorderSide(width: 0.59, color: widget.bordercolor), borderRadius: BorderRadius.circular(29.50))),
                child: Center(child: CaustomText(text: widget.text, color: widget.textcolor, size: 12, maxline: 1, fontWeight: FontWeight.w500)))));
  }
}
