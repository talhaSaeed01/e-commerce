import 'package:ecommerce/utils/appstrings.dart';

class ShippingMethod {
  final String title;
  final String subtitle;

  ShippingMethod({required this.title, required this.subtitle});
}

List<ShippingMethod> shippingMethods = [
  ShippingMethod(title: Appstrings.CheckoutShppingmethodtitle1, subtitle: Appstrings.CheckoutShppingmethodsubtitle1),
  ShippingMethod(title: Appstrings.CheckoutShppingmethodtitle2, subtitle: Appstrings.CheckoutShppingmethodsubtitle2),
  ShippingMethod(title: Appstrings.CheckoutShppingmethodtitle3, subtitle: Appstrings.CheckoutShppingmethodsubtitle3)
];
