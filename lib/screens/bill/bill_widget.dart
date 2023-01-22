import 'package:firstproject/network/invoice_frontend.dart';
import 'package:firstproject/network/pdfdata.dart';
import 'package:firstproject/screens/customerdetail/customer_detail.dart';
import 'package:firstproject/screens/sellproduct/sell_product_widget.dart';
import 'package:flutter/material.dart';

Widget receiptContainer(context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
    height: 300,
    width: MediaQuery.of(context).size.width * 1,
    color: Colors.grey,
  );
}

Widget receiptButton(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
    child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.black,
        onPressed: () async {
          final pdfFile = await InvoicePdf.generate();
          PdfApi.openFile(pdfFile);
        }),
  );
}
