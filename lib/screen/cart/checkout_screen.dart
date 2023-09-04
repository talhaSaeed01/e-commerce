import 'package:ecommerce/class/shipping_method_class.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/caustom_textfield.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedTileIndex = -1;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController streetnameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  CaustomText(text: Appstrings.CheckOutScreenshippingmethod, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                  SizedBox(
                    height: GetScreenSize.getScreenWidth(context) * 0.6,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: shippingMethods.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedTileIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTileIndex = index;
                            });
                          },
                          child: ListTile(
                            title: Text(
                              shippingMethods[index].title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(shippingMethods[index].subtitle),
                            leading: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: 23,
                                height: 43,
                                decoration: ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(width: 4, color: isSelected ? Colors.green : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
