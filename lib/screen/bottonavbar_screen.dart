import 'package:ecommerce/screen/cart/cart_screen.dart';
import 'package:ecommerce/screen/home/home_screen.dart';
import 'package:ecommerce/screen/discover/dicover_screen.dart';
import 'package:ecommerce/screen/setting/setting_screen.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Bottomnavbardesgin extends StatefulWidget {
  final dynamic userid;
  const Bottomnavbardesgin({
    this.userid,
    super.key,
  });

  @override
  State<Bottomnavbardesgin> createState() => _BottomnavbardesginState();
}

class _BottomnavbardesginState extends State<Bottomnavbardesgin> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getPage(_currentIndex),
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
            child: BottomNavigationBar(
                backgroundColor: Colors.black,
                elevation: 9,
                unselectedItemColor: Appcolors.caustomOCimage,
                fixedColor: Appcolors.black,
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
                ])));
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen(currentid: widget.userid);
      case 1:
        return Discoverscreen(currentid: widget.userid);
      case 2:
        return CartScreen(currentid: widget.userid);
      case 3:
        return const SettingScreen();
      default:
        return Container();
    }
  }
}
