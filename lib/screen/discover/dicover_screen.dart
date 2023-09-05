import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screen/discover/widget/discover_tile_desgin.dart';
import 'package:ecommerce/screen/discover/widget/drawer_widget.dart';
import 'package:ecommerce/screen/home/widget/home_drawer.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_search_bar.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class Discoverscreen extends StatefulWidget {
  const Discoverscreen({super.key});

  @override
  State<Discoverscreen> createState() => _DiscoverscreenState();
}

class _DiscoverscreenState extends State<Discoverscreen> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Productprovider>(context, listen: false).adddiscoverProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: const HomeDrawer(),
            endDrawer: const DrawerWidget(),
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), child: Caustom_appbar(title: Appstrings.dicoverscreentitle)),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CaustomSearchbar(
                      isTextFieldEnabled: false,
                    )),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.033),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => discovertiledesgin(
                        circlecolor: Provider.of<Productprovider>(context, listen: true).discoverproductslist[index].circleContainerColor,
                        containerHieght: GetScreenSize.getScreenWidth(context) * 0.49,
                        containerWidth: GetScreenSize.getScreenWidth(context) * 0.86,
                        title: Provider.of<Productprovider>(context, listen: true).discoverproductslist[index].title,
                        tilecolor: Provider.of<Productprovider>(context, listen: true).discoverproductslist[index].tileColor,
                        img: Provider.of<Productprovider>(context, listen: true).discoverproductslist[index].image),
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: Provider.of<Productprovider>(context, listen: true).discoverproductslist.length)
              ]),
            )));
  }
}
