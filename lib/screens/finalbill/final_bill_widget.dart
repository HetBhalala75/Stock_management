import 'package:firstproject/screens/customerdetail/customer_detail.dart';

import 'package:firstproject/screens/productcart/product_cart_widget.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

TextEditingController totalField = TextEditingController(text: totalBill.toString());

Widget amountTotal(String text, void Function(String)? onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 50, right: 50),
        child: Text(
          text,
          style: TextStyle(fontSize: 30),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Container(
          width: 100,
          child: TextField(
            onChanged: onChanged,
            controller: totalField,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTextFormField, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTextFormField, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorTextFormField, width: 2)),
            ),
          ),
        ),
      )
    ],
  );
}

Widget identifyValueContainer(context) {
  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width * 1,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          cartText("Item"),
          cartText("Prize"),
          cartText("QTY"),
          cartText("Total"),
        ],
      ),
    ),
  );
}
