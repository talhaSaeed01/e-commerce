import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Caustomrichtext extends StatefulWidget {
  String richtext1;
  double richtextsize1;
  FontWeight richtextfontwieght1;
  Color richtextcolor1;
  String richtext2;
  double richtextsize2;
  FontWeight richtextfontwieght2;
  Color richtextcolor2;
  Caustomrichtext(
      {super.key,
      required this.richtext1,
      required this.richtext2,
      required this.richtextcolor1,
      required this.richtextcolor2,
      required this.richtextfontwieght1,
      required this.richtextfontwieght2,
      required this.richtextsize1,
      required this.richtextsize2});

  @override
  State<Caustomrichtext> createState() => _CaustomrichtextState();
}

class _CaustomrichtextState extends State<Caustomrichtext> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        text: TextSpan(text: widget.richtext1, style: TextStyle(fontSize: widget.richtextsize1, color: widget.richtextcolor1, fontWeight: widget.richtextfontwieght1), children: <TextSpan>[
          TextSpan(text: widget.richtext2, style: TextStyle(fontSize: widget.richtextsize2, color: widget.richtextcolor2, fontWeight: widget.richtextfontwieght2, decoration: TextDecoration.underline))
        ]));
  }
}
