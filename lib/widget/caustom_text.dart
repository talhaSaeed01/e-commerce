import 'package:flutter/material.dart';

//....custom text usefor everyone...................//
class CaustomText extends StatefulWidget {
  final String text;
  final Color color;
  final double size;
  final int maxline;
  final FontWeight fontWeight;
  const CaustomText({super.key, required this.text, required this.color, required this.size, required this.maxline, required this.fontWeight});
  @override
  State<CaustomText> createState() => _CaustomTextState();
}

class _CaustomTextState extends State<CaustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        maxLines: widget.maxline,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(overflow: TextOverflow.ellipsis, color: widget.color, fontSize: widget.size, fontWeight: widget.fontWeight));
  }
}
