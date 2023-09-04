import 'package:ecommerce/Authentication/Signup_screen.dart';
import 'package:ecommerce/Authentication/forget_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_rich_text.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController signinemailController = TextEditingController();
  TextEditingController signinpasswordController = TextEditingController();
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
                        padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.03, top: GetScreenSize.getScreenWidth(context) * 0.12),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          CaustomText(text: Appstrings.signintitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                          CaustomText(text: Appstrings.signupscreensubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                          Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 35),
                              child: CustomTextField(controller: signinemailController, hinttext: Appstrings.signupnamehint, keyboardfoam: TextInputType.name)),
                          Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 30, right: 8, left: 8),
                              child: CustomTextField(controller: signinpasswordController, hinttext: Appstrings.signuppasswordhint, keyboardfoam: TextInputType.visiblePassword)),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetScreen())),
                                  child: Opacity(
                                      opacity: Appstrings.opacityforlightblacktext,
                                      child: CaustomText(
                                          text: Appstrings.signinforgettext, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.033, maxline: 1, fontWeight: FontWeight.bold)))),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.06),
                          Center(
                              child: CustomTextButton(
                                  bordercolor: Appcolors.white,
                                  hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                  width: GetScreenSize.getScreenWidth(context) * 0.4,
                                  text: Appstrings.signinBTtext,
                                  textcolor: Appcolors.white,
                                  buttoncolor: Appcolors.browncolorbutton)),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.03),
                          Center(
                              child: Opacity(
                                  opacity: Appstrings.opacityforlightblacktext,
                                  child:
                                      CaustomText(text: Appstrings.signinwith, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.03, maxline: 1, fontWeight: FontWeight.w400))),
                          Padding(padding: const EdgeInsets.all(17.0), child: Center(child: Image.asset(Appassets.logosocial))),
                          // const Spacer(),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.09),
                          GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup())),
                              child: Center(
                                  child: Caustomrichtext(
                                      richtext1: Appstrings.signinR1,
                                      richtext2: Appstrings.signinR2,
                                      richtextcolor1: Appcolors.black,
                                      richtextcolor2: Appcolors.black,
                                      richtextfontwieght1: FontWeight.w400,
                                      richtextfontwieght2: FontWeight.w400,
                                      richtextsize1: GetScreenSize.getScreenWidth(context) * 0.04,
                                      richtextsize2: GetScreenSize.getScreenWidth(context) * 0.04))),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.16)
                        ]))))));
  }
}
