import 'package:firstproject/comman/textbutton.dart';
import 'package:firstproject/network/invoice_frontend.dart';
import 'package:firstproject/network/pdfdata.dart';
import 'package:firstproject/network/shared_prefs.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/finalbill/final_bill.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/addproduct/add_product.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/products/product_page.dart';
import 'package:firstproject/screens/sales/sales_page.dart';
import 'package:firstproject/screens/sellproduct/sell_product_page.dart';
import 'package:firstproject/utiles/colors.dart';

class HomePage extends StatefulWidget {
  State createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
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
                    leadingIcon: Icons.menu,
                    onPressed1: () async {
                      // print("hello world");
                      // final pdfFile = await InvoicePdf.generate();
                      // PdfApi.openFile(pdfFile);
                    },
                    centerText: "Home",
                    actionIcon: Icons.power_settings_new,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: Text("Do you want to logout ?"),
                              actions: [
                                textButton(
                                    text: "Log Out",
                                    onPressed: () {
                                      sharedPrefs3(context);
                                      productDetail.clear();
                                      customers.clear();
                                    }),
                                textButton(
                                    text: "cancel",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    }),
                mainContainer(
                  context: context,
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          childContainer(
                            context: context,
                            icon: Icons.qr_code_scanner_outlined,
                            text: "Sell product",
                            route: SellProduct(),
                          ),
                          childContainer(
                            context: context,
                            icon: Icons.playlist_add,
                            text: "Add Product",
                            route: AddProduct(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: smallContainer(
                                    context: context,
                                    icon: Icons.list_alt_outlined,
                                    text: "Products",
                                    route: Products(),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: smallContainer(
                                    context: context,
                                    icon: Icons.sell,
                                    text: "Sales",
                                    route: Sales(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
