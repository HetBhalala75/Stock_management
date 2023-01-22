import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/productprofile/product_profile.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

Widget productList(
  context,
  index,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ProductProfile(
              productDetail[index]["productName"],
              productDetail[index]["productPrize"],
              productDetail[index]["productQTY"],
              productDetail[index]["productImage"],
            );
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width*0.5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      productDetail[index]["productImage"]==null?"https://redzonekickboxing.com/wp-content/uploads/2017/04/default-image-620x600.jpg":productDetail[index]["productImage"],
                      fit: BoxFit.cover,
                    ))),
          ),
          passwordHeadingText(productDetail[index]["productName"].toString()),
          Text('\$ ${productDetail[index]["productPrize"].toString()}')
        ],
      ),
    ),
  );
}
