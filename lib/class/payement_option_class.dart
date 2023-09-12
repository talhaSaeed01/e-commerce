import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appstrings.dart';

class PayementOption {
  final String text;
  final String image;

  PayementOption({required this.text, required this.image});
}

List<PayementOption> payementOption = [
  PayementOption(text: Appstrings.CheckOutScreen2Cash, image: Appassets.checkoutimagecash),
  PayementOption(text: Appstrings.CheckOutScreen2Creditcard, image: Appassets.checkoutimageCreditcard),
  PayementOption(text: Appstrings.CheckOutScreen2more, image: Appassets.checkoutimagemore),
];
