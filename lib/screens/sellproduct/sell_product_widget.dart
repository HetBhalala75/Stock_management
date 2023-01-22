import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/productcart/product_cart.dart';
import 'package:flutter/material.dart';

List<Map> cartDetail = [];

Widget listTile(index, context) {
  int qtyCount = 0;
  return Padding(
    padding: EdgeInsets.all(10),
    child: Card(
      elevation: 10,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        //***********************************************************
        //declaring the value to listTile
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          width: 70,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productDetail[index]["productImage"] == null
                    ? "https://redzonekickboxing.com/wp-content/uploads/2017/04/default-image-620x600.jpg"
                    : productDetail[index]["productImage"],
                fit: BoxFit.cover,
              )),
        ),
        title: Text(productDetail[index]["productName"] == null
            ? ""
            : productDetail[index]["productName"]),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '\u{20B9} ${productDetail[index]["productPrize"].toString() == null ? "" : productDetail[index]["productPrize"].toString()}'),
            Text(
                'Qty : ${productDetail[index]["productQTY"].toString() == null ? "" : productDetail[index]["productQTY"].toString()}'),
          ],
        ),
        //**************************************************************************
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Center(
                        child: Text(productDetail[index]["productName"])),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 50,
                          child: MaterialButton(
                              color: Colors.black,
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  qtyCount--;
                                });
                              }),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          color: Colors.grey,
                          child: Center(
                              child: Text(
                            "$qtyCount",
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                        SizedBox(
                          height: 40,
                          width: 50,
                          child: MaterialButton(
                              color: Colors.black,
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  qtyCount++;
                                });
                              }),
                        ),
                      ],
                    ),
                    actions: [
                      Center(
                        child: MaterialButton(
                          color: Colors.black,
                          child: Text(
                            "ADD",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
//***********************************************************************
//adding the value to cart of customer
                            cartDetail.add(
                              {
                                "productName": productDetail[index]
                                    ["productName"],
                                "productPrize": productDetail[index]
                                    ["productPrize"],
                                "productQty": qtyCount,
                                "totalPrize": productDetail[index]
                                        ["productPrize"] *
                                    qtyCount,
                              },
                            );
                            print(cartDetail.last["productQty"]);
//*************************************************************************
// navigating to customer cart
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductCart();
                                },
                              ),
                            );
//*************************************************************************
// subtracting the cartQty  from the total qty of product
// And update the qty to to firebase
                            productDetail[index]["productQTY"] =
                                productDetail[index]["productQTY"] -
                                    cartDetail.last["productQty"];
                            db
                                .child('register')
                                .child('hetbhalala')
                                .child("Products")
                                .child(productDetail[index]["productName"])
                                .update({
                              "productQTY": productDetail[index]["productQTY"]
                            });
//*******************************************************************
                          },
                        ),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    ),
  );
}

Widget listTileSeprated() {
  return Divider(
    thickness: 4,
    height: 1,
  );
}
