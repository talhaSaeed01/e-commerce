import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:flutter/material.dart';

class Product {
  String title = '';
  final String price;
  final Color tileColor;
  final Color circleContainerColor;
  final String image;
  final String type;
  String sellerId = '';

  Product(this.title, this.price, this.tileColor, this.circleContainerColor, this.image, this.type, this.sellerId);
}

List<Product> products = [
  Product(Appstrings.homeFH1, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature1, "featuredProducts", "wweeeerr"),
  Product(Appstrings.homeFH2, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature2, "featuredProducts", "wweeeerr"),
  Product(Appstrings.homeFH3, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature3, "featuredProducts", "wweeeerr"),
  Product(Appstrings.homeHR1, Appstrings.homeSR1, Appcolors.black, Appcolors.black, Appassets.rcmnd1, "recomendedProducts", "wweeeerr"),
  Product(Appstrings.homeHR2, Appstrings.homeSR2, Appcolors.black, Appcolors.black, Appassets.rcmnd2, "recomendedProducts", "wweeeerr"),
  Product(Appstrings.homeHR3, Appstrings.homeSR3, Appcolors.black, Appcolors.black, Appassets.rcmnd3, "recomendedProducts", "wweeeerr"),
  Product(Appstrings.discovertitle1, Appstrings.homeFS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.feature2, "discoverProducts", "wweeeerr"),
  Product(Appstrings.discovertitle2, Appstrings.homeFS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.di_2, "discoverProducts", "wweeeerr"),
  Product(Appstrings.discovertitle3, Appstrings.homeFS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.di_3, "discoverProducts", "wweeeerr"),
  Product(Appstrings.discovertitle4, Appstrings.homeSR2, Appcolors.discover4TileColor, Appcolors.discover4TileColor, Appassets.feature3, "discoverProducts", "wweeeerr"),
  Product(Appstrings.homeTopCollectionH1, Appstrings.homeTopCollectionS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.collectionimage1, "otherProducts", "wweeeerr"),
  Product(Appstrings.homeTopCollectionH2, Appstrings.homeTopCollectionS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.collectionimage2, "otherProducts", "wweeeerr"),
  Product(Appstrings.homeTopCollectionH3, Appstrings.homeTopCollectionS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.ob2, "otherProducts", "wweeeerr"),
  Product(Appstrings.homeTopCollectionH4, Appstrings.homeTopCollectionS4, Appcolors.discover4TileColor, Appcolors.discover4TileColor, Appassets.collectionimage4, "othrProducts", "wweeeerr"),
  Product(Appstrings.homeFH3, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature3, "popularProducts", "wweeeerr"),
  Product(Appstrings.homeHR1, Appstrings.homeSR1, Appcolors.black, Appcolors.black, Appassets.rcmnd1, "popularProducts", "wweeeerr"),
  Product(Appstrings.homeHR2, Appstrings.homeSR2, Appcolors.black, Appcolors.black, Appassets.rcmnd2, "popularProducts", "wweeeerr"),
  Product(Appstrings.homeHR3, Appstrings.homeSR3, Appcolors.black, Appcolors.black, Appassets.rcmnd3, "popularProducts", "wweeeerr"),
  Product(Appstrings.discovertitle1, Appstrings.homeFS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.feature2, "popularProducts", "wweeeerr"),
  Product(Appstrings.discovertitle2, Appstrings.homeFS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.di_2, "popularProducts", "wweeeerr"),
  Product(Appstrings.discovertitle3, Appstrings.homeFS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.di_3, "popularProducts", "wweeeerr"),
  Product(Appstrings.home2imagetexttitle, Appstrings.homeFS3, Appcolors.boxcoloronboarding.withOpacity(0.05), Appcolors.boxcoloronboarding.withOpacity(0.05), Appassets.ob3, "twobanner", "wweeeerr"),
  Product(Appstrings.home1imagetext, Appstrings.homeFS1, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.shutterstock, "firstBanner", "wweeeerr"),
  Product(Appstrings.homeTopCollectionH1, Appstrings.homeSR1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage1, 'thirdBanner', "wweeeerr"),
  Product(Appstrings.homeTopCollectionH2, Appstrings.homeSR1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage2, 'fourthBanner', "wweeeerr"),
  Product(Appstrings.homeTopCollectionH3, Appstrings.homeFS1, Appcolors.grey, Appcolors.grey, Appassets.ob2, 'fifthBanner', "wweeeerr"),
  Product(Appstrings.homeTopCollectionH4, Appstrings.homeFS1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage4, 'sixBanner', "wweeeerr")
];
// import 'package:ecommerce/utils/appassets.dart';
// import 'package:ecommerce/utils/appcolors.dart';
// import 'package:ecommerce/utils/appstrings.dart';
// import 'package:flutter/material.dart';

// class Product {
//   String title = '';
//   final String price;
//   final Color tileColor;
//   final Color circleContainerColor;
//   final String image;
//   final String type;

//   Product(this.title, this.price, this.tileColor, this.circleContainerColor, this.image, this.type);
// }

// List<Product> products = [
//   Product(Appstrings.homeFH1, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature1, "featuredProducts"),
//   Product(Appstrings.homeFH2, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature2, "featuredProducts"),
//   Product(Appstrings.homeFH3, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature3, "featuredProducts"),
//   Product(Appstrings.homeHR1, Appstrings.homeSR1, Appcolors.black, Appcolors.black, Appassets.rcmnd1, "recomendedProducts"),
//   Product(Appstrings.homeHR2, Appstrings.homeSR2, Appcolors.black, Appcolors.black, Appassets.rcmnd2, "recomendedProducts"),
//   Product(Appstrings.homeHR3, Appstrings.homeSR3, Appcolors.black, Appcolors.black, Appassets.rcmnd3, "recomendedProducts"),
//   Product(Appstrings.discovertitle1, Appstrings.homeFS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.feature2, "discoverProducts"),
//   Product(Appstrings.discovertitle2, Appstrings.homeFS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.di_2, "discoverProducts"),
//   Product(Appstrings.discovertitle3, Appstrings.homeFS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.di_3, "discoverProducts"),
//   Product(Appstrings.discovertitle4, Appstrings.homeSR2, Appcolors.discover4TileColor, Appcolors.discover4TileColor, Appassets.feature3, "discoverProducts"),
//   Product(Appstrings.homeTopCollectionH1, Appstrings.homeTopCollectionS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.collectionimage1, "otherProducts"),
//   Product(Appstrings.homeTopCollectionH2, Appstrings.homeTopCollectionS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.collectionimage2, "otherProducts"),
//   Product(Appstrings.homeTopCollectionH3, Appstrings.homeTopCollectionS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.ob2, "otherProducts"),
//   Product(Appstrings.homeTopCollectionH4, Appstrings.homeTopCollectionS4, Appcolors.discover4TileColor, Appcolors.discover4TileColor, Appassets.collectionimage4, "othrProducts"),
//   Product(Appstrings.homeFH3, Appstrings.homeFS1, Appcolors.black, Appcolors.black, Appassets.feature3, "popularProducts"),
//   Product(Appstrings.homeHR1, Appstrings.homeSR1, Appcolors.black, Appcolors.black, Appassets.rcmnd1, "popularProducts"),
//   Product(Appstrings.homeHR2, Appstrings.homeSR2, Appcolors.black, Appcolors.black, Appassets.rcmnd2, "popularProducts"),
//   Product(Appstrings.homeHR3, Appstrings.homeSR3, Appcolors.black, Appcolors.black, Appassets.rcmnd3, "popularProducts"),
//   Product(Appstrings.discovertitle1, Appstrings.homeFS1, Appcolors.discover1TileColor, Appcolors.discover1TileColor, Appassets.feature2, "popularProducts"),
//   Product(Appstrings.discovertitle2, Appstrings.homeFS2, Appcolors.discover2TileColor, Appcolors.discover2TileColor, Appassets.di_2, "popularProducts"),
//   Product(Appstrings.discovertitle3, Appstrings.homeFS3, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.di_3, "popularProducts"),
//   Product(Appstrings.home2imagetexttitle, Appstrings.homeFS3, Appcolors.boxcoloronboarding.withOpacity(0.05), Appcolors.boxcoloronboarding.withOpacity(0.05), Appassets.ob3, "twobanner"),
//   Product(Appstrings.home1imagetext, Appstrings.homeFS1, Appcolors.discover3TileColor, Appcolors.discover3TileColor, Appassets.shutterstock, "firstBanner"),
//   Product(Appstrings.homeTopCollectionH1, Appstrings.homeSR1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage1, 'thirdBanner'),
//   Product(Appstrings.homeTopCollectionH2, Appstrings.homeSR1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage2, 'fourthBanner'),
//   Product(Appstrings.homeTopCollectionH3, Appstrings.homeFS1, Appcolors.grey, Appcolors.grey, Appassets.ob2, 'fifthBanner'),
//   Product(Appstrings.homeTopCollectionH4, Appstrings.homeFS1, Appcolors.grey, Appcolors.grey, Appassets.collectionimage4, 'sixBanner'),
// ];
