// ignore_for_file: camel_case_types

import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class ocsimple extends StatefulWidget {
  const ocsimple({super.key});

  @override
  State<ocsimple> createState() => _ocsimpleState();
}

class _ocsimpleState extends State<ocsimple> {
  @override
  Widget build(BuildContext context) {
    return Container(width: GetScreenSize.getScreenWidth(context), height: GetScreenSize.getScreenWidth(context) * 0.75, decoration: BoxDecoration(color: Appcolors.boxcoloronboarding));
  }
}
