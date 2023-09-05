import 'package:ecommerce/class/payement_option_class.dart';

import 'package:ecommerce/provider/check_out_provider1.dart';
import 'package:ecommerce/screen/cart/checkout_screen_3.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_heading.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen2 extends StatefulWidget {
  const CheckOutScreen2({super.key});

  @override
  State<CheckOutScreen2> createState() => _CheckOutScreen2State();
}

class _CheckOutScreen2State extends State<CheckOutScreen2> {
  TextEditingController cuponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider1>(context);
    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                          CaustomText(text: Appstrings.CheckOutScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                          SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 18.0, bottom: GetScreenSize.getScreenWidth(context) * 0.045, left: 18, right: 10),
                          child: Center(child: Image.asset(Appassets.checkoutimagecheck2process)),
                        ),
                        CaustomText(text: Appstrings.CheckOutScreen2step2, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.028, maxline: 1, fontWeight: FontWeight.bold),
                        CaustomText(text: Appstrings.CheckOutScreen2payement, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: SizedBox(
                                height: GetScreenSize.getScreenWidth(context) * 0.24,
                                child: ListView.separated(
                                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: payementOption.length,
                                    itemBuilder: (context, index) {
                                      final isSelected = checkoutProvider.selectedTileIndex == index;
                                      return GestureDetector(
                                          onTap: () {
                                            checkoutProvider.setSelectedTileIndex(index);
                                          },
                                          child: Container(
                                              width: 105,
                                              decoration: BoxDecoration(
                                                  color: isSelected ? Appcolors.discover3TileColor : Appcolors.white,
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 1)]),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                                                SizedBox(
                                                    height: 34,
                                                    child: Image.asset(
                                                      payementOption[index].image,
                                                      color: isSelected ? Appcolors.white : Appcolors.discover3TileColor,
                                                    )),
                                                CaustomText(
                                                    text: payementOption[index].text,
                                                    color: isSelected ? Appcolors.white : Appcolors.discover3TileColor,
                                                    size: GetScreenSize.getScreenWidth(context) * 0.045,
                                                    maxline: 1,
                                                    fontWeight: FontWeight.w400)
                                              ])));
                                    }))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: CaustomHeading(
                                lefttext: Appstrings.CheckOutScreen2Heading1left,
                                lefttextcolor: Appcolors.black,
                                lefttextsize: GetScreenSize.getScreenWidth(context) * 0.05,
                                leftfontwieght: FontWeight.bold,
                                righttext: Appstrings.CheckOutScreen2Heading1right,
                                righttextcolor: Appcolors.heartcolor,
                                rightttextsize: GetScreenSize.getScreenWidth(context) * 0.03,
                                righttfontwieght: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(bottom: GetScreenSize.getScreenWidth(context) * 0.045), child: Center(child: Image.asset(Appassets.checkoutimagecard))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CaustomText(
                                text: Appstrings.CheckOutScreen2checkinwith, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.w400)),
                        Padding(padding: const EdgeInsets.only(bottom: 12), child: SizedBox(height: 34, child: Image.asset(Appassets.checkoutimagepaymentmethod)))
                      ])),
                  Container(
                      decoration: BoxDecoration(color: Appcolors.white, borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)), boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 2, offset: Offset(0, 2)),
                      ]),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                          child: SizedBox(
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              CaustomText(text: Appstrings.CartProductprice, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                              CaustomText(text: Appstrings.CartProductpriceamount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                            ]),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  CaustomText(text: Appstrings.CartShipping, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold),
                                  CaustomText(text: Appstrings.CartShippingamount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.045, maxline: 1, fontWeight: FontWeight.bold)
                                ])),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              CaustomText(text: Appstrings.CartSubtotal, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                              CaustomText(text: Appstrings.CartSubtotalamount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold)
                            ]),
                            Row(children: <Widget>[
                              Checkbox(
                                  value: checkoutProvider.isCheckboxChecked,
                                  onChanged: (bool? newValue) {
                                    if (newValue != null) {
                                      checkoutProvider.toggleCheckbox(newValue);
                                    }
                                  }),
                              CaustomText(
                                  text: Appstrings.CheckOutScreen2checkboxtext, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 3, fontWeight: FontWeight.w400)
                            ]),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOut_Screen3())),
                              child: CustomTextButton(
                                  bordercolor: Appcolors.discover3TileColor,
                                  hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                  width: GetScreenSize.getScreenWidth(context) * 0.9,
                                  text: Appstrings.CheckOutScreen2button,
                                  textcolor: Appcolors.white,
                                  buttoncolor: Appcolors.discover3TileColor),
                            )
                          ]))))
                ])))));
  }
}
