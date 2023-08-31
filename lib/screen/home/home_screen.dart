import 'package:ecommerce/class/featured_poduct_class.dart';
import 'package:ecommerce/class/recomended_product.dart';
import 'package:ecommerce/screen/home/widget/Each_categorey_desgin.dart';
import 'package:ecommerce/screen/home/widget/featured_productdesgin_screen.dart';
import 'package:ecommerce/screen/home/widget/rcmnd_product.dart';
import 'package:ecommerce/screen/home/widget/vertical_tile_desgin.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_heading.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../class/categorey_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          child: Column(children: [
            Caustom_appbar(title: Appstrings.homescreentitle),
            Padding(
              padding: EdgeInsets.symmetric(vertical: GetScreenSize.getScreenWidth(context) * 0.06),
              child: SizedBox(
                  width: GetScreenSize.getScreenWidth(context),
                  height: GetScreenSize.getScreenWidth(context) * 0.18,
                  child: Center(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => EachCategoreyDesgin(image: categories[index].imageAsset, text: categories[index].name),
                          separatorBuilder: (context, index) => SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.09)))),
            ),
            Container(
                width: GetScreenSize.getScreenWidth(context) * 0.87,
                height: GetScreenSize.getScreenWidth(context) * 0.44,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage(Appassets.shutterstock), fit: BoxFit.fill)),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: CaustomText(text: Appstrings.home1imagetext, color: Appcolors.white, size: GetScreenSize.getScreenWidth(context) * 0.055, maxline: 3, fontWeight: FontWeight.bold))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: CaustomHeading(
                    lefttext: Appstrings.homeH1l,
                    lefttextcolor: Appcolors.black,
                    lefttextsize: GetScreenSize.getScreenWidth(context) * 0.05,
                    leftfontwieght: FontWeight.bold,
                    righttext: Appstrings.homeH1R,
                    righttextcolor: Appcolors.grey,
                    rightttextsize: GetScreenSize.getScreenWidth(context) * 0.03,
                    righttfontwieght: FontWeight.bold))
          ])),
      SizedBox(
          height: GetScreenSize.getScreenWidth(context) * 0.63,
          child: ListView.separated(
              padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.04),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FeaturedProductDesgin(img: featuredProducts[index].img, name: featuredProducts[index].name, price: featuredProducts[index].price),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: featuredProducts.length)),
      Container(
          color: Appcolors.boxcoloronboarding.withOpacity(0.05),
          height: GetScreenSize.getScreenWidth(context) * 0.5,
          width: double.infinity,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(top: GetScreenSize.getScreenWidth(context) * 0.1, bottom: GetScreenSize.getScreenWidth(context) * 0.02),
                  child: CaustomText(
                      text: Appstrings.home2imagetexttitle, color: Appcolors.grey.withOpacity(0.63), size: GetScreenSize.getScreenWidth(context) * 0.019, maxline: 1, fontWeight: FontWeight.bold)),
              CaustomText(
                  text: Appstrings.home2imagetextsubtitle, color: Appcolors.black.withOpacity(0.44), size: GetScreenSize.getScreenWidth(context) * 0.065, maxline: 2, fontWeight: FontWeight.bold)
            ]),
            Image.asset(Appassets.ob2),
          ])),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: CaustomHeading(
              lefttext: Appstrings.homeH2l,
              lefttextcolor: Appcolors.black,
              lefttextsize: GetScreenSize.getScreenWidth(context) * 0.05,
              leftfontwieght: FontWeight.bold,
              righttext: Appstrings.homeH2R,
              righttextcolor: Appcolors.grey,
              rightttextsize: GetScreenSize.getScreenWidth(context) * 0.03,
              righttfontwieght: FontWeight.bold)),
      SizedBox(
        height: GetScreenSize.getScreenWidth(context) * 0.3,
        width: double.infinity,
        child: ListView.separated(
            padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.04),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => RcmndProductScreen(img: recomendedProducts[index].img, title: recomendedProducts[index].name, price: recomendedProducts[index].price),
            separatorBuilder: (context, index) => const SizedBox(width: 3),
            itemCount: recomendedProducts.length),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: CaustomHeading(
              lefttext: Appstrings.homeH3l,
              lefttextcolor: Appcolors.black,
              lefttextsize: GetScreenSize.getScreenWidth(context) * 0.05,
              leftfontwieght: FontWeight.bold,
              righttext: Appstrings.homeH3R,
              righttextcolor: Appcolors.grey,
              rightttextsize: GetScreenSize.getScreenWidth(context) * 0.03,
              righttfontwieght: FontWeight.bold)),
      verticaltiledesgin(
          containerHieght: GetScreenSize.getScreenWidth(context) * 0.40,
          containerWidth: GetScreenSize.getScreenWidth(context) * 0.87,
          title: Appstrings.homeTopCollectionH1,
          subtitle: Appstrings.homeTopCollectionS1,
          titlecolor: Appcolors.grey,
          subtitlecolor: Appcolors.black.withOpacity(0.75),
          img: Appassets.collectionimage1),
      verticaltiledesgin(
          containerHieght: GetScreenSize.getScreenWidth(context) * 0.41,
          containerWidth: GetScreenSize.getScreenWidth(context) * 0.87,
          title: Appstrings.homeTopCollectionH2,
          subtitle: Appstrings.homeTopCollectionS2,
          titlecolor: Appcolors.grey,
          subtitlecolor: Appcolors.black.withOpacity(0.85),
          img: Appassets.collectionimage2),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
            width: GetScreenSize.getScreenWidth(context) * 0.40,
            height: GetScreenSize.getScreenWidth(context) * 0.54,
            decoration: BoxDecoration(color: Appcolors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(height: double.infinity, width: GetScreenSize.getScreenWidth(context) * 0.23, child: Image.asset(Appassets.feature1, fit: BoxFit.fill)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                CaustomText(text: Appstrings.homeTopCollectionH3, color: Appcolors.grey, size: 12, maxline: 1, fontWeight: FontWeight.w400),
                CaustomText(text: Appstrings.homeTopCollectionS3, color: Appcolors.black.withOpacity(0.75), size: 19, maxline: 2, fontWeight: FontWeight.bold)
              ])
            ])),
        Container(
            width: GetScreenSize.getScreenWidth(context) * 0.40,
            height: GetScreenSize.getScreenWidth(context) * 0.54,
            decoration: BoxDecoration(color: Appcolors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                CaustomText(text: Appstrings.homeTopCollectionH4, color: Appcolors.grey, size: 12, maxline: 1, fontWeight: FontWeight.w400),
                CaustomText(text: Appstrings.homeTopCollectionS4, color: Appcolors.black.withOpacity(0.75), size: 19, maxline: 2, fontWeight: FontWeight.bold)
              ]),
              SizedBox(height: double.infinity, width: GetScreenSize.getScreenWidth(context) * 0.2, child: Image.asset(Appassets.collectionimage4, fit: BoxFit.fill)),
            ]))
      ])
    ]))));
  }
}
