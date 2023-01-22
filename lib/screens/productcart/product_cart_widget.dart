import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/productcart/product_cart.dart';
import 'package:firstproject/screens/sellproduct/sell_product_page.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:flutter/material.dart';

Widget cartText(String text) {
  return Expanded(
    child: Text(
      text,
      style: TextStyle(fontSize: 30),
    ),
  );
}

Widget floatingActionButtonExtended(context) {
  return FloatingActionButton.extended(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SellProduct(),
        ),
      );
    },
    label: Text("Add More"),
    backgroundColor: Colors.black,
  );
}
