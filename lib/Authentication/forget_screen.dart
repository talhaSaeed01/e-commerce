import 'package:ecommerce/Authentication/otp_screen.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController fSemailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 35),
                              child: CaustomText(text: Appstrings.FStitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)),
                          Opacity(
                              opacity: Appstrings.opacityforlightblacktext,
                              child: CaustomText(text: Appstrings.FSsubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 3, fontWeight: FontWeight.w400)),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, right: 15, bottom: 50),
                              child: CustomTextField(controller: fSemailcontroller, hinttext: Appstrings.FSemailhint, keyboardfoam: TextInputType.emailAddress, prefixIcon: const Icon(Icons.mail))),
                          Center(
                              child: GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OtPScreen())),
                                  child: CustomTextButton(
                                      bordercolor: Appcolors.white,
                                      hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                      width: GetScreenSize.getScreenWidth(context) * 0.4,
                                      text: Appstrings.FSbutton,
                                      textcolor: Appcolors.white,
                                      buttoncolor: Appcolors.browncolorbutton)))
                        ]))))));
  }
}
