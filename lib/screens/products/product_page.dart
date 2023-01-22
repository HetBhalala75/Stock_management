import 'package:firstproject/comman/appbar.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/home/home_page_widget.dart';
import 'package:firstproject/screens/products/product_widget.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                appbar(leadingIcon: Icons.arrow_back_ios, centerText: "Products"),
                mainContainer(
                  context: context,
                  child: GridView.builder(
                    itemCount: productDetail.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1/1.4,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return productList(
                        context,
                        index,
                      );
                    },
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
