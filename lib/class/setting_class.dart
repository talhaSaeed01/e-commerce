import 'package:flutter/material.dart';

class Setting {
  final IconData icon;
  final String text;
  final IconData icon2;

  Setting({
    required this.icon,
    required this.text,
    required this.icon2,
  });
}

List<Setting> settinglist = [
  Setting(icon: Icons.real_estate_agent_outlined, text: 'Address', icon2: Icons.arrow_forward_ios),
  Setting(icon: Icons.wallet, text: 'Payment method', icon2: Icons.arrow_forward_ios),
  Setting(icon: Icons.join_right_rounded, text: 'Voucher', icon2: Icons.arrow_forward_ios),
  Setting(icon: Icons.favorite, text: 'My Wishlist', icon2: Icons.arrow_forward_ios),
  Setting(icon: Icons.star, text: 'Rate this app', icon2: Icons.arrow_forward_ios),
];
