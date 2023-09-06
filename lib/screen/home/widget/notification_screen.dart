import 'package:ecommerce/screen/home/widget/msg_desgin.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';

class NotificaionScreen extends StatefulWidget {
  const NotificaionScreen({super.key});

  @override
  State<NotificaionScreen> createState() => _NotificaionScreenState();
}

class _NotificaionScreenState extends State<NotificaionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                    CaustomText(text: Appstrings.CheckOutScreentitle, color: Appcolors.black, size: GetScreenSize.getScreenWidth(context) * 0.05, maxline: 1, fontWeight: FontWeight.bold),
                    SizedBox(width: GetScreenSize.getScreenWidth(context) * 0.035)
                  ]),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      child: Column(children: [
                        MsgDesgin(title: Appstrings.notititle1, subtitle: Appstrings.notisubtitle1),
                        Padding(padding: const EdgeInsets.only(top: 7, bottom: 7), child: MsgDesgin(title: Appstrings.notititle2, subtitle: Appstrings.notisubtitle2)),
                        MsgDesgin(title: Appstrings.notititle3, subtitle: Appstrings.notisubtitle3)
                      ]))
                ]))));
  }
}
