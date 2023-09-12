import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screen/discover/widget/drawer_widget.dart';
import 'package:ecommerce/screen/home/widget/featured_productdesgin_screen.dart';
import 'package:ecommerce/utils/appcolors.dart';
import 'package:ecommerce/utils/appstrings.dart';
import 'package:ecommerce/utils/get_screen_size.dart';
import 'package:ecommerce/widget/caustom_arrow_backbutton.dart';
import 'package:ecommerce/widget/caustom_heading.dart';
import 'package:ecommerce/widget/caustom_search_bar.dart';
import 'package:ecommerce/widget/caustom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<Productprovider>().fetchAndSetProductsFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            endDrawer: const DrawerWidget(),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        GestureDetector(onTap: () => Navigator.pop(context), child: const CustomArrowback()),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: CaustomSearchbar(isTextFieldEnabled: true)),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(Appstrings.searchtitle1), const Icon(Icons.delete)]),
                              SizedBox(
                                  child: Column(children: [
                                const SizedBox(height: 17),
                                Icon(Icons.assignment, color: Appcolors.caustomOCimage, size: GetScreenSize.getScreenWidth(context) * 0.2),
                                CaustomText(text: Appstrings.nothinghere, color: Appcolors.boxcoloronboarding, size: 13, maxline: 1, fontWeight: FontWeight.w400),
                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 4),
                                    child: CaustomHeading(
                                        lefttext: Appstrings.searchtitle2,
                                        lefttextcolor: Appcolors.black,
                                        lefttextsize: GetScreenSize.getScreenWidth(context) * 0.044,
                                        leftfontwieght: FontWeight.bold,
                                        righttext: Appstrings.homeH1R,
                                        righttextcolor: Appcolors.grey,
                                        rightttextsize: GetScreenSize.getScreenWidth(context) * 0.03,
                                        righttfontwieght: FontWeight.bold))
                              ]))
                            ]))
                      ])),
                  SizedBox(
                      height: GetScreenSize.getScreenWidth(context) * 0.63,
                      child: ListView.separated(
                          padding: EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.04),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => FeaturedProductDesgin(
                              img: Provider.of<Productprovider>(context, listen: true).popularproductslist[index].image,
                              name: Provider.of<Productprovider>(context, listen: true).popularproductslist[index].title,
                              price: Provider.of<Productprovider>(context, listen: true).popularproductslist[index].price),
                          separatorBuilder: (context, index) => const SizedBox(width: 20),
                          itemCount: Provider.of<Productprovider>(context, listen: true).popularproductslist.length))
                ])))));
  }
}
