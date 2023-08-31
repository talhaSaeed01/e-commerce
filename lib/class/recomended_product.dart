import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appstrings.dart';

class RecomendedProduct {
  final String name;
  final String price;
  final String img;

  RecomendedProduct({
    required this.name,
    required this.price,
    required this.img,
  });
}

final List<RecomendedProduct> recomendedProducts = [
  RecomendedProduct(name: Appstrings.homeHR1, price: Appstrings.homeSR1, img: Appassets.rcmnd1),
  RecomendedProduct(name: Appstrings.homeHR2, price: Appstrings.homeSR2, img: Appassets.rcmnd2),
  RecomendedProduct(name: Appstrings.homeHR3, price: Appstrings.homeSR3, img: Appassets.rcmnd3),
];
