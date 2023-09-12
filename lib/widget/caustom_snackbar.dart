// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class CaustomSnackbar extends SnackBar {
  final Widget text;
  final Color color;
  @override
  final SnackBarAction action;
  const CaustomSnackbar({Key? key, required this.text, required this.color, required this.action}) : super(key: key, content: text, backgroundColor: color, action: action);

  Widget build(BuildContext context) {
    return SnackBar(elevation: 15, content: text, backgroundColor: color, action: action, duration: const Duration(seconds: 3));
  }
}
