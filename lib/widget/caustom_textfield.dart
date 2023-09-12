// ignore_for_file: must_be_immutable

import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Icon? prefixIcon;
  final TextInputType keyboardfoam;
  String hinttext;
  CustomTextField({super.key, required this.controller, required this.hinttext, required this.keyboardfoam, this.prefixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: Appstrings.opacityforlightblacktext,
        child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardfoam,
            decoration: InputDecoration(hintText: widget.hinttext, hintStyle: TextStyle(color: Appcolors.black), prefixIcon: widget.prefixIcon, prefixIconColor: Appcolors.white)));
  }
}
