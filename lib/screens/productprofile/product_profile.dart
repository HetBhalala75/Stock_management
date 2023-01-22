import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

class ProductProfile extends StatefulWidget {
  String a = "";
  int b = 0;
  String? c;
  int d = 0;

  ProductProfile(this.a, this.b, this.d, this.c);

  @override
  _ProductProfileState createState() => _ProductProfileState();
}

class _ProductProfileState extends State<ProductProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40), bottomRight :Radius.circular(40) ),
                    child: Image.network(widget.c!,fit: BoxFit.cover,))),
            SizedBox(
              height: 20,
            ),
            headingText(widget.a),
            SizedBox(
              height: 20,
            ),
            passwordHeadingText("price: \$${widget.b}"),
            SizedBox(
              height: 20,
            ),
            passwordHeadingText("QTY : ${widget.d}"),
          ],
        ),
      ),
    );
  }
}
