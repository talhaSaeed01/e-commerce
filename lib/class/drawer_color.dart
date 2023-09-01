import 'package:flutter/material.dart';

class DrawerColor {
  final String name;
  final Color color;

  DrawerColor({required this.name, required this.color});
}

List<DrawerColor> drawerColors = [
  DrawerColor(name: "Red", color: Colors.red),
  DrawerColor(name: "Green", color: Colors.green),
  DrawerColor(name: "Blue", color: Colors.blue),
  DrawerColor(name: "Purple", color: Colors.purple),
  DrawerColor(name: "Orange", color: Colors.orange),
];
