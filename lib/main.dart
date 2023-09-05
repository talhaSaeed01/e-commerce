import 'package:ecommerce/onboarding/welcome_screen.dart';
import 'package:ecommerce/provider/bottom_sheet_provider.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/check_out_provider1.dart';
import 'package:ecommerce/provider/detail_screen_provider.dart';
import 'package:ecommerce/provider/drawer_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomSheetProvider>(
          create: (_) => BottomSheetProvider(),
        ),
        ChangeNotifierProvider<Productprovider>(
          create: (_) => Productprovider(),
        ),
        ChangeNotifierProvider<DrawerProvider>(
          create: (_) => DrawerProvider(),
        ),
        ChangeNotifierProvider<DetailScreenProvider>(
          create: (_) => DetailScreenProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider1>(
          create: (_) => CheckoutProvider1(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: WelcomeScreen(),
        ),
      ),
    );
  }
}
