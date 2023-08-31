import 'package:ecommerce/screen/discover/widget/discover_tile_desgin.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_search_bar.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class Discoverscreen extends StatefulWidget {
  const Discoverscreen({super.key});

  @override
  State<Discoverscreen> createState() => _DiscoverscreenState();
}

class _DiscoverscreenState extends State<Discoverscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), child: Caustom_appbar(title: Appstrings.dicoverscreentitle)),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: CaustomSearchbar()),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        discovertiledesgin(
            circlecolor: Appcolors.circlecontainercolor,
            containerHieght: GetScreenSize.getScreenWidth(context) * 0.49,
            containerWidth: GetScreenSize.getScreenWidth(context) * 0.86,
            title: "skdkjd",
            titlecolor: Appcolors.black,
            img: Appassets.feature2)
      ])
    ])));
  }
}
