import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/customerprofile/customer_profile_widget.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

class CustomerProfile extends StatefulWidget {
  String? a;
  String? b;
  List c = [];
  final d;
  final e;
  final f;

  CustomerProfile(this.a, this.b, this.c, this.d, this.e, this.f);

  @override
  State createState() {
    return CustomerProfileState();
  }
}

class CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(
              leadingIcon: Icons.arrow_back_ios,
              actionIcon: Icons.clear,
              centerText: "Customer",
              onPressed: () {},
            ),
            mainContainer(
                context: context,
                child: Column(
                  children: [
                    headingText("${widget.a}"),
                    passwordHeadingText("${widget.b}"),
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
                              itemCount: widget.c.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${widget.c[index]["productName"]}"),
                                      Text("${widget.c[index]["productPrize"]}"),
                                      Text("${widget.c[index]["productQty"]}"),
                                      Text("${widget.c[index]["totalPrize"]}"),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: passwordHeadingText("total:  \u{20B9}${widget.d}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: passwordHeadingText("discount: ${widget.f}%"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                          passwordHeadingText("net Price:  \u{20B9} ${widget.e}"),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
