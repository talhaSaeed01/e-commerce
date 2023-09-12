// ignore_for_file: file_names
import 'package:ecommerce/provider/fire_base_authprovider.dart';
import 'package:ecommerce/Authentication/signin_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_rich_text.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController signupemailController = TextEditingController();
  TextEditingController signuppasswordController = TextEditingController();
  TextEditingController signupnameController = TextEditingController();
  TextEditingController signupcnfrmpasswordController = TextEditingController();
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
                          CaustomText(text: Appstrings.signupscreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                          CaustomText(text: Appstrings.signupscreensubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                          Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 35),
                              child: CustomTextField(controller: signupnameController, hinttext: Appstrings.signupnamehint, keyboardfoam: TextInputType.name)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(controller: signupemailController, hinttext: Appstrings.signupemailhint, keyboardfoam: TextInputType.emailAddress)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(controller: signuppasswordController, hinttext: Appstrings.signuppasswordhint, keyboardfoam: TextInputType.visiblePassword)),
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 40),
                              child: CustomTextField(controller: signupcnfrmpasswordController, hinttext: Appstrings.signupcnfrmpasshint, keyboardfoam: TextInputType.visiblePassword)),
                          Center(
                              child: GestureDetector(
                                  onTap: () {
                                    final authProvider = Provider.of<AuthProvider>(context, listen: false);
                                    authProvider.signUp(
                                        signupnameController.text.trim(), signupemailController.text.trim(), signuppasswordController.text.trim(), signupcnfrmpasswordController.text.trim(), context);
                                  },
                                  child: CustomTextButton(
                                      bordercolor: Appcolors.white,
                                      hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                      width: GetScreenSize.getScreenWidth(context) * 0.4,
                                      text: Appstrings.signupbutton,
                                      textcolor: Appcolors.white,
                                      buttoncolor: Appcolors.browncolorbutton))),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.03),
                          Center(
                              child: Opacity(
                                  opacity: Appstrings.opacityforlightblacktext,
                                  child:
                                      CaustomText(text: Appstrings.signupWith, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.03, maxline: 1, fontWeight: FontWeight.w400))),
                          Padding(padding: const EdgeInsets.all(17.0), child: Center(child: Image.asset(Appassets.logosocial))),
                          Center(
                              child: GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin())),
                                  child: Caustomrichtext(
                                      richtext1: Appstrings.signupR1,
                                      richtext2: Appstrings.signupR2,
                                      richtextcolor1: Appcolors.black,
                                      richtextcolor2: Appcolors.black,
                                      richtextfontwieght1: FontWeight.w400,
                                      richtextfontwieght2: FontWeight.w400,
                                      richtextsize1: GetScreenSize.getScreenWidth(context) * 0.04,
                                      richtextsize2: GetScreenSize.getScreenWidth(context) * 0.04)))
                        ]))))));
  }
}
