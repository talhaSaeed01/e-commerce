import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appstrings.dart';

class Category {
  final String name;
  final String imageAsset;

  Category({
    required this.name,
    required this.imageAsset,
  });
}

List<Category> categories = [
  Category(name: Appstrings.homeCT1, imageAsset: Appassets.icon1),
  Category(name: Appstrings.homeCT2, imageAsset: Appassets.icon2),
  Category(name: Appstrings.homeCT3, imageAsset: Appassets.icon3),
  Category(name: Appstrings.homeCT4, imageAsset: Appassets.icon4),
];
