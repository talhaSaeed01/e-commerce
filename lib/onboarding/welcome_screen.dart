import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/onboarding/page_indicator.dart';
import 'package:ecommerce/screen/Rider/rider_pannel.dart';
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
      // SizedBox(height: double.infinity, width: double.infinity, child: Image.asset(Appassets.welcomebackgroundimage, fit: BoxFit.fitHeight)),
      SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CachedNetworkImage(
              imageUrl: Appassets.welcomebackgroundimage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fitHeight)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.47,
          left: GetScreenSize.getScreenWidth(context) * 0.13,
          child: CaustomText(text: Appstrings.welcomeh1, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.41,
          left: GetScreenSize.getScreenWidth(context) * 0.19,
          child: CaustomText(text: Appstrings.welcomeh2, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold)),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.24,
          left: GetScreenSize.getScreenWidth(context) * 0.21,
          child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RiderPannel())),
              child: CustomTextButton(
                  bordercolor: Appcolors.white,
                  hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                  width: GetScreenSize.getScreenWidth(context) * 0.52,
                  text: Appstrings.riderscreen,
                  textcolor: Appcolors.white,
                  buttoncolor: Appcolors.white.withOpacity(0.25)))),
      // Positioned(
      //     bottom: GetScreenSize.getScreenWidth(context) * 0.4,
      //     left: GetScreenSize.getScreenWidth(context) * 0.21,
      //     child: GestureDetector(
      //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RiderPannel())),
      //         child: CustomTextButton(
      //             bordercolor: Appcolors.white,
      //             hieght: GetScreenSize.getScreenWidth(context) * 0.13,
      //             width: GetScreenSize.getScreenWidth(context) * 0.52,
      //             text: Appstrings.sellerScreenbutton,
      //             textcolor: Appcolors.white,
      //             buttoncolor: Appcolors.white.withOpacity(0.25)))),
      Positioned(
          bottom: GetScreenSize.getScreenWidth(context) * 0.08,
          left: GetScreenSize.getScreenWidth(context) * 0.21,
          child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PageIndicatorExample())),
              child: CustomTextButton(
                  bordercolor: Appcolors.white,
                  hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                  width: GetScreenSize.getScreenWidth(context) * 0.52,
                  text: Appstrings.btwelcome,
                  textcolor: Appcolors.white,
                  buttoncolor: Appcolors.white.withOpacity(0.25))))
    ])));
  }
}
