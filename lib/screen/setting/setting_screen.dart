import 'package:ecommerce/Authentication/signin_screen.dart';
import 'package:ecommerce/class/setting_class.dart';
import 'package:ecommerce/provider/fire_base_authprovider.dart';
import 'package:ecommerce/utils/appassets.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(top: 40, left: 3, bottom: 25, right: 5),
          child: ListTile(
              leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(Appassets.avatar)),
              title: Text(Appstrings.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Text(Appstrings.email, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
              trailing: const Icon(Icons.settings))),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 21),
          child: Container(
              height: 370,
              width: double.infinity,
              decoration: ShapeDecoration(
                  color: Appcolors.white,
                  shape: RoundedRectangleBorder(side: BorderSide(width: 0.50, color: Appcolors.white), borderRadius: BorderRadius.circular(15)),
                  shadows: const [BoxShadow(color: Color(0x330E0E0E), blurRadius: 13, offset: Offset(0, 4), spreadRadius: -8)]),
              child: Column(children: [
                const SizedBox(height: 8),
                SizedBox(
                    height: 280,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Icon(settinglist[index].icon, color: Appcolors.discover3TileColor.withOpacity(0.45)),
                                const SizedBox(width: 10),
                                Expanded(child: Text(settinglist[index].text)),
                                Icon(settinglist[index].icon2, color: Appcolors.discover3TileColor.withOpacity(0.45), size: 15),
                                const SizedBox(width: 19)
                              ]));
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: settinglist.length)),
                const Divider(),
                GestureDetector(
                    onTap: () {
                      authProvider.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Signin()));
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Icon(Icons.logout, color: Appcolors.discover3TileColor.withOpacity(0.45)), const SizedBox(width: 10), Expanded(child: Text(Appstrings.logout))])))
              ])))
    ])));
  }
}
