// ignore_for_file: file_names
import 'package:ecommerce/provider/bottom_sheet_provider.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Newpass extends StatefulWidget {
  const Newpass({super.key});

  @override
  State<Newpass> createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
  TextEditingController newpassController = TextEditingController();
  TextEditingController reenternewpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bottomSheetProvider = Provider.of<BottomSheetProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.03, top: GetScreenSize.getScreenWidth(context) * 0.08),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CaustomText(text: Appstrings.newpasstitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                          ),
                          Opacity(
                              opacity: Appstrings.opacityforlightblacktext,
                              child:
                                  CaustomText(text: Appstrings.newpasssubtitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 2, fontWeight: FontWeight.w400)),
                          Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 35),
                              child: CustomTextField(controller: newpassController, hinttext: Appstrings.newpassh1, keyboardfoam: TextInputType.name)),
                          Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 30, right: 8, left: 8),
                              child: CustomTextField(controller: reenternewpassController, hinttext: Appstrings.newpassh2, keyboardfoam: TextInputType.visiblePassword)),
                          SizedBox(height: GetScreenSize.getScreenWidth(context) * 0.06),
                          Center(
                              child: GestureDetector(
                            onTap: () {
                              bottomSheetProvider.openBottomSheet(context);
                            },
                            child: CustomTextButton(
                                hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                width: GetScreenSize.getScreenWidth(context) * 0.4,
                                text: Appstrings.newpassbutton,
                                textcolor: Appcolors.white,
                                buttoncolor: Appcolors.browncolorbutton),
                          ))
                        ]))))));
  }
}
