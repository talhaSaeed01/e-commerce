import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appstrings.dart';

class FeaturedProduct {
  final String name;
  final String price;
  final String img;

  FeaturedProduct({
    required this.name,
    required this.price,
    required this.img,
  });
}

final List<FeaturedProduct> featuredProducts = [
  FeaturedProduct(name: Appstrings.homeFH1, price: Appstrings.homeFS1, img: Appassets.feature1),
  FeaturedProduct(name: Appstrings.homeFH2, price: Appstrings.homeFS2, img: Appassets.feature2),
  FeaturedProduct(name: Appstrings.homeFH3, price: Appstrings.homeFS3, img: Appassets.feature3),
];
