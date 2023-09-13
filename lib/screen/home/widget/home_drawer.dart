import 'package:ecommerce/screen/cart/cart_screen.dart';
import 'package:ecommerce/screen/discover/search_screen.dart';
import 'package:ecommerce/screen/setting/setting_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_text_button.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(35), topRight: Radius.circular(35)),
        child: Drawer(
            elevation: 5,
            width: MediaQuery.of(context).size.width * 0.63,
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 25, left: 3, bottom: 25),
                  child: ListTile(
                      leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(Appassets.avatar)),
                      title: Text(Appstrings.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Text(Appstrings.email, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)))),
              SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 1 / 1.8,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        const Divider(),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Icon(Icons.home, color: Appcolors.grey),
                              const SizedBox(width: 7),
                              Text(Appstrings.home, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))
                            ])),
                        const Divider(),
                        GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen())),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Icon(Icons.search, color: Appcolors.grey),
                              const SizedBox(width: 7),
                              Text(Appstrings.search, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))
                            ])),
                        const Divider(),
                        GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Icon(Icons.shopping_bag, color: Appcolors.grey),
                              const SizedBox(width: 7),
                              Text(Appstrings.cart, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))
                            ])),
                        const Divider(),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen())),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                            Icon(Icons.person, color: Appcolors.grey),
                            const SizedBox(width: 7),
                            Text(Appstrings.setting, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))
                          ]),
                        ),
                      ]))),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 15, top: 20),
                child: CaustomText(text: Appstrings.other, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.04, maxline: 1, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  height: GetScreenSize.getScreenWidth(context) * 0.3,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Icon(Icons.support, color: Appcolors.grey),
                          const SizedBox(width: 7),
                          Text(Appstrings.support, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))
                        ]),
                        const Divider(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(Icons.help, color: Appcolors.grey), const SizedBox(width: 7), Text(Appstrings.aboutus, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17))]),
                        const Divider(),
                      ]))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                      width: GetScreenSize.getScreenWidth(context) * 1,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        CustomTextButton(
                            bordercolor: Appcolors.black,
                            hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                            width: GetScreenSize.getScreenWidth(context) * 0.25,
                            text: Appstrings.light,
                            textcolor: Appcolors.white,
                            buttoncolor: Appcolors.browncolorbutton.withOpacity(0.75)),
                        CustomTextButton(
                            bordercolor: Appcolors.black,
                            hieght: GetScreenSize.getScreenWidth(context) * 0.1,
                            width: GetScreenSize.getScreenWidth(context) * 0.25,
                            text: Appstrings.dark,
                            textcolor: Appcolors.white,
                            buttoncolor: Appcolors.browncolorbutton.withOpacity(0.75))
                      ])))
            ])));
  }
}
