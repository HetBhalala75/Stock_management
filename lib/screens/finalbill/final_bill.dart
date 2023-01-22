import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/network/userdata.dart';
import 'package:firstproject/screens/bill/bill.dart';
import 'package:firstproject/screens/customerdetail/customer_detail.dart';
import 'package:firstproject/screens/finalbill/final_bill_widget.dart';
import 'package:firstproject/screens/productcart/product_cart_widget.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinalBill extends StatefulWidget {
  @override
  _FinalBillState createState() => _FinalBillState();
}

List<Map> customers = [];
List<Map> customerinvoice = [];



double netPrice = totalBill.toDouble();

double a = 0;

class _FinalBillState extends State<FinalBill> {
  @override
  void initState() {
    totalField.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          //************************************************************
          await db
              .child('register')
              .child(await username1())
              .child('customers')
              .child(customerName.text)
              .child('customerProfile')
              .set({
            "customername": customerName.text,
            "customermobile": customerMobile.text,
          });
          //************************************************************
          await db
              .child('register')
              .child(await username1())
              .child('customers')
              .child(customerName.text)
              .child('customerCart')
              .set({
            "productcart": cartDetail.sublist(0),
            "cartTotal": totalBill,
            "netPrize": netPrice,
            "discount": a,
          });
          //************************************************************
          customers.add(
            {
              "customername": customerName.text,
              "customermobile": customerMobile.text,
              "customercart": cartDetail.sublist(0),
              "cartTotal": totalBill,
              "netPrize": netPrice,
              "discount": a,
            },
          );
          //************************************************************
          customerinvoice.add(
            {
              "customername": customerName.text,
              "customermobile": customerMobile.text,
              "customercart": cartDetail.sublist(0),
              "cartTotal": totalBill,
              "netPrize": netPrice,
              "discount": a,
            },
          );
          //************************************************************

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Bill();
          }));
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
                  centerText: "Invoice",
                  onPressed: () {}),
              SizedBox(
                height: 30,
              ),
              identifyValueContainer(context),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1,
                // margin: EdgeInsets.only(top: 20),
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
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 20, top: 20, left: 50, right: 50),
                            child: Text(
                              "Total",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: 20, top: 20, right: 50),
                            child: Text(
                              totalBill.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ]),
                    amountTotal("Discount", (val) {
                      setState(() {
                        a = double.parse(val);
                        double temp = a / 100;
                        double temp1 = temp * totalBill;
                        double temp3 = totalBill.toDouble();
                        netPrice = temp3 - temp1;
                      });
                    }),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 20, top: 20, left: 50, right: 50),
                            child: Text(
                              "Net Price",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: 20, top: 20, right: 50),
                            child: Text(
                              netPrice.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
