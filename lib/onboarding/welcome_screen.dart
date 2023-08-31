import 'package:ecommerce/onboarding/page_indicator.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      SizedBox(height: double.infinity, width: double.infinity, child: Image.asset(Appassets.welcomebackgroundimage, fit: BoxFit.fitHeight)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.65,
          left: GetScreenSize.getScreenWidth(context) * 0.13,
          child: CaustomText(text: Appstrings.welcomeh1, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.55,
          left: GetScreenSize.getScreenWidth(context) * 0.19,
          child: CaustomText(text: Appstrings.welcomeh2, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.28,
          left: GetScreenSize.getScreenWidth(context) * 0.21,
          child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PageIndicatorExample())),
              child: CustomTextButton(
                  hieght: GetScreenSize.getScreenWidth(context) * 0.15,
                  width: GetScreenSize.getScreenWidth(context) * 0.55,
                  text: Appstrings.btwelcome,
                  textcolor: Appcolors.white,
                  buttoncolor: Appcolors.white.withOpacity(0.25))))
    ])));
  }
}
