import 'package:ecommerce/screen/bottonavbar_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class CheckOut_Screen3 extends StatefulWidget {
  const CheckOut_Screen3({super.key});

  @override
  State<CheckOut_Screen3> createState() => _CheckOut_Screen3State();
}

class _CheckOut_Screen3State extends State<CheckOut_Screen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                    CaustomText(text: Appstrings.CheckOutScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                    SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
                  ]),
                  Padding(
                      padding: EdgeInsets.only(top: 38.0, bottom: GetScreenSize.getScreenWidth(context) * 0.065, left: 18, right: 10),
                      child: Center(child: Image.asset(Appassets.checkoutimageprocess3))),
                  CaustomText(text: Appstrings.CheckOutScreen3ordercomp, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.058, maxline: 1, fontWeight: FontWeight.bold),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 60), child: Center(child: Image.asset(Appassets.checkoutimageorder))),
                  Center(
                      child: SizedBox(
                          width: GetScreenSize.getScreenWidth(context) * 0.66,
                          child: Text(Appstrings.CheckOutScreen3ordercomptext,
                              textAlign: TextAlign.center, style: TextStyle(color: Appcolors.black, fontSize: 14, fontFamily: 'Product Sans Medium', fontWeight: FontWeight.w400, height: 0)))),
                  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnavbardesgin())),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: CustomTextButton(
                              bordercolor: Appcolors.discover3TileColor,
                              hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                              width: GetScreenSize.getScreenWidth(context) * 0.9,
                              text: Appstrings.CheckOutScreen3Button,
                              textcolor: Appcolors.white,
                              buttoncolor: Appcolors.discover3TileColor)))
                ])))));
  }
}
