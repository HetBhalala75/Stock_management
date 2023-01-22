import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/bill/bill_widget.dart';
import 'package:firstproject/screens/customerdetail/customer_detail.dart';
import 'package:firstproject/screens/customerprofile/customer_profile_widget.dart';
import 'package:firstproject/screens/home/home_page.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

class Bill extends StatefulWidget {


  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
           customerName.clear();
           customerMobile.clear();
          cartDetail.removeRange(0, cartDetail.length);
          sum = 0;
        },
        child: Container(
          height: 50,
          color: Colors.grey,
          child: Center(
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [
              appbar(
                leadingIcon: Icons.arrow_back_ios,
                actionIcon: Icons.clear,
                centerText: "Receipt",
                onPressed: () {},
              ),
              mainContainer(
                context: context,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                              height: 30,
                              width: MediaQuery.of(context).size.width * 1,
                              color: Colors.grey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  containertext("item"),
                                  containertext("prize"),
                                  containertext("Qty"),
                                  containertext("total"),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 1,
                              color: Colors.grey,
                              child: ListView.builder(
                                  itemCount: cartDetail.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${cartDetail[index]["productName"]}"),
                                          Text(cartDetail[index]["productPrize"].toString()),
                                          Text(cartDetail[index]["productQty"].toString()),
                                          Text(cartDetail[index]["totalPrize"].toString()),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        // receiptContainer(context),
                        receiptButton("print"),
                        // receiptButton("Send"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
