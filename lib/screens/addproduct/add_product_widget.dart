import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/network/userdata.dart';
import 'package:firstproject/screens/addproduct/add_product.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

TextEditingController productName = TextEditingController();
TextEditingController productPrice = TextEditingController();
TextEditingController productQTY = TextEditingController();
TextEditingController productDescription = TextEditingController();
TextEditingController suplierName = TextEditingController();
TextEditingController suplierPrice = TextEditingController();
TextEditingController suplierContact = TextEditingController();
TextEditingController suplierEmailId = TextEditingController();


List<Map> productDetail = [];

Widget floatingActionButton({context}) {
  return FloatingActionButton.extended(
    onPressed: () async {
      //*********************************************************
      if (addProductsFieldKey.currentState!.validate() == true) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [CircularProgressIndicator()],
              actionsAlignment: MainAxisAlignment.center,
            );
          },
        );
        //********************************************************
        //uploading the image into the firebase
        await uploadImage(images1);
        //********************************************************
        //setting the value in firebase of all products which are added by user
        db
            .child('register')
            .child(await username1())
            .child("Products")
            .child(productName.text)
            .set({
          "productName": productName.text,
          "productPrize": double.parse(productPrice.text),
          "productQTY": double.parse(productQTY.text),
          "productImage": await uploadImage(images1),
        });
        //**********************************************************
        //fetching the value from the firebase and adding to list<Map>
        productDetail.add({
          "productName": await db
              .child('register')
              .child(await username1())
              .child("Products")
              .child(productName.text)
              .once()
              .then((value) => value.value["productName"]),
          "productPrize": await db
              .child('register')
              .child(await username1())
              .child("Products")
              .child(productName.text)
              .once()
              .then((value) => value.value["productPrize"]),
          "productQTY": await db
              .child('register')
              .child(await username1())
              .child("Products")
              .child(productName.text)
              .once()
              .then((value) => value.value["productQTY"]),
          "productImage": await db
              .child('register')
              .child(await username1())
              .child("Products")
              .child(productName.text)
              .once()
              .then((value) => value.value["productImage"]),
        });
        //********************************************************
        //navigating to home page
        Navigator.pop(context);
        Navigator.pop(context);
        //********************************************************

        //********************************************************
        //clearing the value of textFields and image
        productName.clear();
        productPrice.clear();
        productQTY.clear();
        images1 = File("");
        //********************************************************

      } else {
        addProductsFieldKey.currentState!.validate();
      }
    },
    label: Text(
      "Generate QR",
      style: TextStyle(fontSize: 20),
    ),
    icon: Icon(
      Icons.qr_code_scanner_outlined,
      size: 30,
    ),
    backgroundColor: Colors.black,
  );
}

Widget textFormField(TextEditingController text, String? name) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: TextFormField(
      controller: text,
      validator: (val) {
        if (val!.isEmpty) {
          return "fill The Text field";
        }
      },
      cursorColor: Colors.black,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorTextFormField, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorTextFormField, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorTextFormField, width: 2)),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Text(
              name!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
          )),
    ),
  );
}

Widget descriptionField() {
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Product DESCRIPTION :",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600),
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: TextField(
          cursorColor: Colors.black,
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: colorAddProductField, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorAddProductField, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorAddProductField, width: 2)),
          ),
        ),
      ),
    ],
  );
}

Widget alignText1() {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Suplier's Detial",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600),
      ));
}

Widget alignText2() {
  return Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      width: 130,
      child: Divider(thickness: 3, color: Colors.grey.shade600),
    ),
  );
}

Widget imageCard(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    height: MediaQuery.of(context).size.height * 0.5,
    child: ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Image.file(
        images1,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 1,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.add_photo_alternate,
            size: 100,
            color: Colors.grey,
          );
        },
      ),
    ),
  );
}

Future getDataFromDB() async {
  //***********************************************************
  //fetching the value from the firebase and adding to list<Map>
  return await db
      .child('register')
      .child(await username1())
      .child("Products")
      .once()
      .then((value) async {
    await value.value.forEach(
      (k, v) {
        productDetail.add(
          {
            "productName": v['productName'],
            "productPrize": v["productPrize"],
            "productQTY": v["productQTY"],
            "productImage": v["productImage"]
          },
        );
      },
    );
  }
  );
}

Future<String> uploadImage(File? image) async {
  await Firebase.initializeApp();
  Reference ref1 =
      FirebaseStorage.instance.ref().child('image').child(productName.text);
  await ref1.putFile(File(image!.path));
  Future<String> ref2 = ref1.getDownloadURL();

  return await ref2;
}

Widget chooseImageButton({required void Function()? onPressed}) {
  return MaterialButton(
    color: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onPressed: onPressed,
    child: Text("choose Image"),
  );
}
