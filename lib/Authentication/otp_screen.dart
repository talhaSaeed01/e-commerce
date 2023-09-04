import 'package:ecommerce/Authentication/new_password_Screen.dart';
import 'package:ecommerce/Authentication/widget/otp_Input_field.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class OtPScreen extends StatefulWidget {
  const OtPScreen({super.key});

  @override
  State<OtPScreen> createState() => _OtPScreenState();
}

class _OtPScreenState extends State<OtPScreen> {
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
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: CaustomText(text: Appstrings.OTPtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)),
                          Opacity(
                              opacity: Appstrings.opacityforlightblacktext,
                              child: CaustomText(text: Appstrings.OTPsubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 3, fontWeight: FontWeight.w400)),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.06),
                          const OtpInputField(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: GetScreenSize.getScreenWidth(context) * 0.08),
                            child: Opacity(
                                opacity: Appstrings.opacityforlightblacktext,
                                child: CaustomText(text: Appstrings.OTPresend, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.03, maxline: 3, fontWeight: FontWeight.w400)),
                          ),
                          Center(
                              child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Newpass())),
                            child: CustomTextButton(
                                bordercolor: Appcolors.white,
                                hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                width: GetScreenSize.getScreenWidth(context) * 0.4,
                                text: Appstrings.FSbutton,
                                textcolor: Appcolors.white,
                                buttoncolor: Appcolors.browncolorbutton),
                          ))
                        ]))))));
  }
}
