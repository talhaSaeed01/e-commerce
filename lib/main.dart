// ignore_for_file: unused_local_variable

import 'package:ecommerce/class/product_class.dart';
import 'package:ecommerce/firebase/firebase_manager.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/onboarding/welcome_screen.dart';
import 'package:ecommerce/provider/rider_provider.dart';
import 'package:ecommerce/provider/bottom_sheet_provider.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/check_out_provider1.dart';
import 'package:ecommerce/provider/current_user_provider.dart';
import 'package:ecommerce/provider/detail_screen_provider.dart';
import 'package:ecommerce/provider/drawer_provider.dart';
import 'package:ecommerce/provider/fire_base_authprovider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/seller_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await uploadDataToFirestore(products);
  List<Product> retrievedProducts = await fetchProductsFromFirestore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<BottomSheetProvider>(create: (_) => BottomSheetProvider()),
      ChangeNotifierProvider<Productprovider>(create: (_) => Productprovider()),
      ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
      ChangeNotifierProvider<DetailScreenProvider>(create: (_) => DetailScreenProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ChangeNotifierProvider<CheckoutProvider1>(create: (_) => CheckoutProvider1()),
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<Riderprovider>(create: (_) => Riderprovider()),
      ChangeNotifierProvider<SellerProvider>(create: (_) => SellerProvider()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
    ], child: MaterialApp(theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()), debugShowCheckedModeBanner: false, home: const Scaffold(body: WelcomeScreen())));
  }
}
