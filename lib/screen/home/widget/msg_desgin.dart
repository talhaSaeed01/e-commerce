import 'package:ecommerce/utils/appcolors.dart';
import 'package:flutter/material.dart';

class MsgDesgin extends StatefulWidget {
  String title;
  String subtitle;
  MsgDesgin({super.key, required this.title, required this.subtitle});

  @override
  State<MsgDesgin> createState() => _MsgDesginState();
}

class _MsgDesginState extends State<MsgDesgin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: ShapeDecoration(
            color: Appcolors.white,
            shape: RoundedRectangleBorder(side: BorderSide(width: 0.50, color: Appcolors.white), borderRadius: BorderRadius.circular(15)),
            shadows: const [BoxShadow(color: Color(0x330E0E0E), blurRadius: 13, offset: Offset(0, 4), spreadRadius: -8)]),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), Text(widget.subtitle), Container(color: Appcolors.white)]))
        ]));
  }
}
