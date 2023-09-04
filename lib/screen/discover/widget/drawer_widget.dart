import 'package:ecommerce/class/drawer_color.dart';
import 'package:ecommerce/provider/drawer_provider.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DrawerProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), bottomLeft: Radius.circular(35)),
        child: Drawer(
            elevation: 5,
            width: GetScreenSize.getScreenWidth(context) * 1 / 1.5,
            child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 9),
                child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CaustomText(text: Appstrings.drawertitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.06, maxline: 1, fontWeight: FontWeight.bold),
                    Container(
                        width: GetScreenSize.getScreenWidth(context) * 0.12,
                        height: 29,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                        decoration: ShapeDecoration(
                            color: Appcolors.grey.withOpacity(0.13),
                            image: DecorationImage(image: AssetImage(Appassets.filter)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))))
                  ]),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CaustomText(text: Appstrings.drawerprice, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold)),
                  RangeSlider(
                      values: RangeValues(drawerProvider.startValue.toDouble(), drawerProvider.endValue.toDouble()),
                      min: 0,
                      max: 100,
                      activeColor: Appcolors.purpleColor,
                      onChanged: (RangeValues values) {
                        drawerProvider.setRangeValues(values.start.round(), values.end.round());
                      }),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('\$ ${drawerProvider.startValue}'), Text('\$ ${drawerProvider.endValue}')]),
                  CaustomText(text: Appstrings.drawercolor, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.18,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CircleAvatar(backgroundColor: drawerColors[index].color, radius: 12),
                          separatorBuilder: (context, index) => const SizedBox(width: 15),
                          itemCount: drawerColors.length)),
                  CaustomText(text: Appstrings.drawercategory, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Appcolors.white,
                              border: Border.all(color: Appcolors.black, width: 1),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: <BoxShadow>[BoxShadow(color: Appcolors.caustomOCimage, blurRadius: 1)]),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButton(
                                  value: drawerProvider.selectedCountry,
                                  items: [
                                    DropdownMenuItem(
                                        value: "United Kingdom",
                                        child: Row(children: [
                                          Image.asset(Appassets.shirt),
                                          const SizedBox(width: 10),
                                          Text(Appstrings.dc1, style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.04))
                                        ])),
                                    DropdownMenuItem(
                                        value: "Canada",
                                        child: Row(children: [
                                          Image.asset(Appassets.shirt),
                                          const SizedBox(width: 10),
                                          Text(Appstrings.dc2, style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.04))
                                        ])),
                                    DropdownMenuItem(
                                        value: "Russia",
                                        child: Row(children: [
                                          Image.asset(Appassets.shirt),
                                          const SizedBox(width: 10),
                                          Text(Appstrings.dc3, style: TextStyle(color: Appcolors.black, fontSize: GetScreenSize.getScreenWidth(context) * 0.04))
                                        ]))
                                  ],
                                  onChanged: (value) {
                                    drawerProvider.setSelectedCountry(value.toString());
                                  },
                                  icon: const Padding(padding: EdgeInsets.only(left: 20), child: Icon(Icons.arrow_drop_down)),
                                  iconEnabledColor: Colors.black,
                                  style: const TextStyle(color: Colors.black, fontSize: 20),
                                  dropdownColor: Appcolors.white,
                                  underline: Container(),
                                  isExpanded: true)))),
                  CaustomText(text: Appstrings.drawerdisccount, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.bold),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.3,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          CustomTextButton(
                              bordercolor: Appcolors.black,
                              hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                              width: GetScreenSize.getScreenWidth(context) * 0.25,
                              text: Appstrings.drawerdisccountb1,
                              textcolor: Appcolors.black,
                              buttoncolor: Appcolors.white.withOpacity(0.25)),
                          CustomTextButton(
                              bordercolor: Appcolors.black,
                              hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                              width: GetScreenSize.getScreenWidth(context) * 0.25,
                              text: Appstrings.drawerdisccountb3,
                              textcolor: Appcolors.black,
                              buttoncolor: Appcolors.white.withOpacity(0.25))
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          CustomTextButton(
                              bordercolor: Appcolors.black,
                              hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                              width: GetScreenSize.getScreenWidth(context) * 0.25,
                              text: Appstrings.drawerdisccountb3,
                              textcolor: Appcolors.black,
                              buttoncolor: Appcolors.white.withOpacity(0.25)),
                          CustomTextButton(
                              bordercolor: Appcolors.black,
                              hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                              width: GetScreenSize.getScreenWidth(context) * 0.25,
                              text: Appstrings.drawerdisccountb4,
                              textcolor: Appcolors.black,
                              buttoncolor: Appcolors.white.withOpacity(0.25))
                        ])
                      ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        CaustomText(text: Appstrings.drawerreset, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w300),
                        CustomTextButton(
                            bordercolor: Appcolors.black,
                            hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                            width: GetScreenSize.getScreenWidth(context) * 0.25,
                            text: Appstrings.drawerdisccountb4,
                            textcolor: Appcolors.white,
                            buttoncolor: Appcolors.browncolorbutton.withOpacity(0.75))
                      ]))
                ])))));
  }
}
