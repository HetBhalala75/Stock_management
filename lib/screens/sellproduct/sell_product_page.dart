import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

class SellProduct extends StatefulWidget {
  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                appbar(
                  leadingIcon: Icons.arrow_back_ios,
                  centerText: "Sell Product",
                  actionIcon: Icons.settings,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                mainContainer(
                  context: context,
                  child: ListView.builder(
                    itemCount: productDetail.length,
                    itemBuilder: (context, index) {
                      return listTile(index, context);
                    },

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
