import 'package:ecommerce/class/shipping_method_class.dart';
import 'package:ecommerce/provider/check_out_provider1.dart';
import 'package:ecommerce/screen/cart/checkout_Screen2.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen1 extends StatefulWidget {
  const CheckOutScreen1({super.key});

  @override
  State<CheckOutScreen1> createState() => _CheckOutScreen1State();
}

class _CheckOutScreen1State extends State<CheckOutScreen1> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController streetnameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController cuponCodeController = TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider1>(context);
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: SingleChildScrollView(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                          CaustomText(text: Appstrings.CheckOutScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                          SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
                        ]),
                        Padding(
                          padding: EdgeInsets.only(top: 18.0, bottom: GetScreenSize.getScreenWidth(context) * 0.045),
                          child: Center(child: Image.asset(Appassets.checkoutimage)),
                        ),
                        CaustomText(text: Appstrings.CheckOutScreenstep1, color: Appcolors.grey, size: GetScreenSize.getScreenWidth(context) * 0.028, maxline: 1, fontWeight: FontWeight.bold),
                        CaustomText(text: Appstrings.CheckOutScreenshipping, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 1, fontWeight: FontWeight.bold),
                        CustomTextField(controller: firstnameController, hinttext: Appstrings.CheckOutfirstname, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: lastnameController, hinttext: Appstrings.CheckOutlastname, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: countryController, hinttext: Appstrings.CheckOutcountry, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: streetnameController, hinttext: Appstrings.CheckOutcity, keyboardfoam: TextInputType.streetAddress),
                        CustomTextField(controller: cityController, hinttext: Appstrings.CheckOutcity, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: stateController, hinttext: Appstrings.CheckOutstate, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: zipCodeController, hinttext: Appstrings.CheckOutzipCode, keyboardfoam: TextInputType.name),
                        CustomTextField(controller: phonenumberController, hinttext: Appstrings.CheckOutphonenumber, keyboardfoam: TextInputType.phone),
                        Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 10),
                            child: CaustomText(
                                text: Appstrings.CheckOutScreenshippingmethod, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold)),
                        const Divider(),
                        SizedBox(
                            height: GetScreenSize.getScreenWidth(context) * 0.7,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => const Divider(),
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: shippingMethods.length,
                                itemBuilder: (context, index) {
                                  final isSelected = checkoutProvider.selectedTileIndex == index;
                                  return GestureDetector(
                                      onTap: () {
                                        checkoutProvider.setSelectedTileIndex(index);
                                      },
                                      child: ListTile(
                                          title: Text(shippingMethods[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                          subtitle: Text(shippingMethods[index].subtitle),
                                          leading: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Container(
                                                  width: 23,
                                                  height: 43,
                                                  decoration: ShapeDecoration(shape: OvalBorder(side: BorderSide(width: 4, color: isSelected ? Appcolors.green : Appcolors.grey)))))));
                                })),
                        const Divider(),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child:
                                CaustomText(text: Appstrings.CheckOutCouponCode, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold)),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                color: Appcolors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [BoxShadow(color: Appcolors.grey.withOpacity(0.3), blurRadius: 1, spreadRadius: 1, offset: const Offset(0, 3))]),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: LayoutBuilder(builder: (context, constraints) {
                              return Row(children: [
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.only(bottom: 4),
                                        child: Form(
                                            autovalidateMode: AutovalidateMode.always,
                                            child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: cuponCodeController,
                                                showCursor: true,
                                                textAlignVertical: TextAlignVertical.bottom,
                                                decoration: InputDecoration(
                                                    hintText: Appstrings.CheckOutCouponCodeHint,
                                                    contentPadding: const EdgeInsets.only(left: 11, right: 3, top: 18, bottom: 11),
                                                    border: InputBorder.none,
                                                    hintMaxLines: 1))))),
                                SizedBox(
                                    width: constraints.maxWidth * 0.2,
                                    child: CaustomText(
                                        text: Appstrings.CheckOutCouponCodeValidate,
                                        color: Appcolors.heartcolor,
                                        size: GetScreenSize.getScreenWidth(context) * 0.04,
                                        maxline: 1,
                                        fontWeight: FontWeight.bold))
                              ]);
                            })),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: CaustomText(
                                text: Appstrings.CheckOutBillingaddress, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold)),
                        Row(children: <Widget>[
                          Checkbox(
                              value: checkoutProvider.isCheckboxChecked,
                              onChanged: (bool? newValue) {
                                if (newValue != null) {
                                  checkoutProvider.toggleCheckbox(newValue);
                                }
                              }),
                          CaustomText(text: Appstrings.CheckBoxtext, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w400)
                        ]),
                        GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen2())),
                            child: CustomTextButton(
                                bordercolor: Appcolors.discover3TileColor,
                                hieght: GetScreenSize.getScreenWidth(context) * 0.13,
                                width: GetScreenSize.getScreenWidth(context) * 0.9,
                                text: Appstrings.CheckOutButton,
                                textcolor: Appcolors.white,
                                buttoncolor: Appcolors.discover3TileColor)),
                        const SizedBox(height: 15)
                      ]),
                    )))));
  }
}
