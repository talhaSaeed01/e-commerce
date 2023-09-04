// ignore_for_file: camel_case_types, prefer_final_fields, unused_import

import 'dart:async';
import 'package:ecommerce/Authentication/Signup_screen.dart';
import 'package:ecommerce/onboarding/onboarding_screen1.dart';
import 'package:ecommerce/onboarding/onboarding_screen2.dart';
import 'package:ecommerce/onboarding/onboarding_screen3.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorExample extends StatefulWidget {
  const PageIndicatorExample({super.key});

  @override
  State<PageIndicatorExample> createState() => _PageIndicatorExampleState();
}

class _PageIndicatorExampleState extends State<PageIndicatorExample> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(controller: _controller, children: const [OnboardingScreen1(), OnboardingScreen2(), OnboardingScreen3()]),
      Container(
          alignment: const Alignment(0, 0.65),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(dotWidth: 10, dotHeight: 10, dotColor: Appcolors.caustomOCimage, activeDotColor: Appcolors.white),
            )
          ])),
      Container(
          alignment: const Alignment(0, 0.85),
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup())),
            child: CustomTextButton(
              bordercolor: Appcolors.white,
              hieght: GetScreenSize.getScreenWidth(context) * 0.12,
              width: GetScreenSize.getScreenWidth(context) * 0.42,
              text: Appstrings.buttontextShoppingnow,
              textcolor: Appcolors.white,
              buttoncolor: Appcolors.white.withOpacity(0.25),
            ),
          ))
    ]));
  }
}
