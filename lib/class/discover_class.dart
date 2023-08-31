import 'package:flutter/material.dart';

class Discover {
  final String title;
  final Color containerColor;
  final Color circleContainerColor;
  final Image image;

  Discover({
    required this.title,
    required this.containerColor,
    required this.circleContainerColor,
    required this.image,
  });
}

List<Discover> discoverList = [
  Discover(
    title: "Discover 1",
    containerColor: Colors.red,
    circleContainerColor: Colors.white,
    image: Image.asset("assets/images/discover_1.png"),
  ),
  Discover(
    title: "Discover 2",
    containerColor: Colors.blue,
    circleContainerColor: Colors.white,
    image: Image.asset("assets/images/discover_2.png"),
  ),
  Discover(
    title: "Discover 3",
    containerColor: Colors.green,
    circleContainerColor: Colors.white,
    image: Image.asset("assets/images/discover_3.png"),
  ),
];
