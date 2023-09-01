import 'package:ecommerce/onboarding/welcome_screen.dart';
import 'package:ecommerce/provider/bottom_sheet_provider.dart';
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
