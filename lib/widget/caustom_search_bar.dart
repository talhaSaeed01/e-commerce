// import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/screen/discover/search_screen.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class CaustomSearchbar extends StatefulWidget {
  final bool isTextFieldEnabled;

  const CaustomSearchbar({Key? key, required this.isTextFieldEnabled}) : super(key: key);

  @override
  State<CaustomSearchbar> createState() => _CaustomSearchbarState();
}

class _CaustomSearchbarState extends State<CaustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: GetScreenSize.getScreenWidth(context) * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Appcolors.grey.withOpacity(0.13)),
          child: Row(children: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            Expanded(
                child: widget.isTextFieldEnabled
                    ? TextField(decoration: InputDecoration(border: InputBorder.none, hintText: Appstrings.discoverappbarhint))
                    : GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                        },
                        child: Text(Appstrings.discoverappbarhint, style: TextStyle(fontSize: 20, height: 2, color: Appcolors.grey.withOpacity(0.6)))))
          ])),
      InkWell(
          onTap: (() {
            Scaffold.of(context).openEndDrawer();
          }),
          child: Container(
              width: GetScreenSize.getScreenWidth(context) * 0.15,
              height: 49,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              decoration: ShapeDecoration(
                  color: Appcolors.grey.withOpacity(0.13), image: DecorationImage(image: AssetImage(Appassets.filter)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))))
    ]);
  }
}
