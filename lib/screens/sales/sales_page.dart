import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/customerprofile/customer_profile.dart';
import 'package:firstproject/screens/finalbill/final_bill.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              appbar(
                leadingIcon: Icons.arrow_back_ios,
                centerText: "Sales",
                actionIcon: Icons.settings,
              ),
              mainContainer(
                  context: context,
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CustomerProfile(
                                      customers[index]["customername"],
                                      customers[index]["customermobile"],
                                      customers[index]["productcart"],
                                      customers[index]["cartTotal"],
                                      customers[index]["netPrize"],
                                      customers[index]["discount"],
                                    );
                                  }));
                                },
                                title: Text(customers[index]["customername"]),
                                subtitle: Text(
                                    "\u{20B9} ${customers[index]["netPrize"]}"),
                              ),
                            ),
                          );
                        }),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
