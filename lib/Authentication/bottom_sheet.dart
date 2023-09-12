import 'package:ecommerce/screen/bottonavbar_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: GetScreenSize.getScreenWidth(context) * 0.75,
        child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 5),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(Appassets.success),
              Padding(
                  padding: EdgeInsets.only(top: GetScreenSize.getScreenWidth(context) * 0.05, bottom: GetScreenSize.getScreenWidth(context) * 0.04),
                  child: CaustomText(text: Appstrings.bottomsheettitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold)),
              Opacity(
                  opacity: Appstrings.opacityforlightblacktext,
                  child: CaustomText(text: Appstrings.bottomsheetsubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.03, maxline: 1, fontWeight: FontWeight.w400)),
              SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.07),
              GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottomnavbardesgin())),
                  child: CustomTextButton(
                      bordercolor: Appcolors.white,
                      hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                      width: GetScreenSize.getScreenWidth(context) * 0.8,
                      text: Appstrings.bottomsheetbutton,
                      textcolor: Appcolors.white,
                      buttoncolor: Appcolors.browncolorbutton))
            ])));
  }
}
