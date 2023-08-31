import 'package:ecommerce/utils/appcolors.dart';
import 'package:flutter/material.dart';

class CustomArrowback extends StatelessWidget {
  const CustomArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4.0,
        shape: const CircleBorder(),
        shadowColor: Appcolors.black,
        child: CircleAvatar(
            backgroundColor: Appcolors.white,
            child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Appcolors.black,
                ))));
  }
}
