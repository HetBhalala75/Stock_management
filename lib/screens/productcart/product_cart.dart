import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/comman/bottom_navigation_bar.dart';
import 'package:firstproject/screens/customerdetail/customer_detail.dart';
import 'package:firstproject/screens/finalbill/final_bill_widget.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/productcart/product_cart_widget.dart';
import 'package:firstproject/screens/sellproduct/sell_product_page.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionButtonExtended(context),
        bottomNavigationBar: bottomNavigationBar(context, CustomerDetail()),
        body: Column(
          children: [
            appbar(
              centerText: "Cart",
              onPressed: () {},
              leadingIcon: Icons.settings,
              actionIcon: Icons.print,
            ),
            SizedBox(
              height: 20,
            ),
            identifyValueContainer(context),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.86,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: cartDetail.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width * 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              cartText(cartDetail[index]["productName"]),
                              SizedBox(
                                width: 20,
                              ),
                              cartText(
                                  cartDetail[index]["productPrize"].toString()),
                              SizedBox(
                                width: 20,
                              ),
                              cartText(
                                  cartDetail[index]["productQty"].toString()),
                              cartText(
                                  cartDetail[index]["totalPrize"].toString()),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
