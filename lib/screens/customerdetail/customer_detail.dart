import 'package:firstproject/comman/appbar.dart';

import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/finalbill/final_bill.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/productcart/product_cart.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerDetail extends StatefulWidget {
  @override
  _CustomerDetailState createState() => _CustomerDetailState();
}

TextEditingController customerName = TextEditingController();
TextEditingController customerMobile = TextEditingController();
double sum = 0;
double totalBill = 0;
GlobalKey<FormState> customerDetailField=GlobalKey();
class _CustomerDetailState extends State<CustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {

          for (int i = 0; i < cartDetail.length; i++) {
            final temp = cartDetail[i]["totalPrize"];
            sum = sum + temp;
          }
          setState(() {
            totalBill = sum.toDouble();
          });

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return FinalBill();
          }));
        },
        child: Container(
          height: 50,
          color: Colors.grey,
          child: Center(
            child: Text(
              "Confirmed",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          appbar(
              leadingIcon: Icons.arrow_back_ios,
              actionIcon: Icons.clear,
              centerText: "Customer Detail",
              onPressed: () {}),
          Expanded(
              child: mainContainer(
                  context: context,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Form(
                      key: customerDetailField,
                      child: Column(
                        children: [
                          textFormField(customerName, "Customer name: "),
                          textFormField(customerMobile, "Customer Mobile: ")
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    ));
  }
}
