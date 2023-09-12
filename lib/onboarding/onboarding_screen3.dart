import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_OC_image.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/oc_simple.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(height: double.infinity, width: double.infinity, color: Appcolors.white),
      const Positioned(bottom: 0, child: ocsimple()),
      Positioned(
          left: GetScreenSize.getScreenWidth(context) * 0.20,
          top: GetScreenSize.getScreenWidth(context) * 0.12,
          child: CaustomText(text: Appstrings.onboardingScreen3title, color: Appcolors.black, size: 17, maxline: 1, fontWeight: FontWeight.bold)),
      Positioned(
          left: GetScreenSize.getScreenWidth(context) * 0.15,
          top: GetScreenSize.getScreenWidth(context) * 0.24,
          child: CaustomText(text: Appstrings.onboardingScreen3subtitle, color: Appcolors.black, size: 12, maxline: 1, fontWeight: FontWeight.w400)),
      Positioned(left: GetScreenSize.getScreenWidth(context) * 0.15, bottom: GetScreenSize.getScreenWidth(context) * 0.42, child: CustomOCimage(image: Appassets.ob3))
    ])));
  }
}
