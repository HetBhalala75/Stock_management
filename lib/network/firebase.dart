import 'package:firebase_database/firebase_database.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/password/password_page_widget.dart';

import 'package:firstproject/screens/register/register_page_widget.dart';
import 'package:flutter/cupertino.dart';

DatabaseReference db = FirebaseDatabase.instance.reference();

DatabaseReference registerDatabasePath = db
    .child('register')
    .child('${firstNameController.text + lastNameController.text}')
    .child('userprofile');

Map userDetail = {
  'firstname': firstNameController.text,
  'lastname': lastNameController.text,
  'emailid': emailController.text,
  'mobilenNo': mobileNoNameController.text,
  "password": passwordController.text,
};

DatabaseReference loginDatabasePath(username) =>
    db.child('register').child(username);

Future<String> productname(productname) => db
    .child('register')
    .child('hetbhalala')
    .child("product Detail")
    .child(productname)
    .once()
    .then((value) => value.value["productName"]);

Future<int> productprice = db
    .child('register')
    .child('hetbhalala')
    .child("product Detail")
    .child(productName.text)
    .once()
    .then((value) => value.value["productPrize"]);

Future<int> productqty = db
    .child('register')
    .child('hetbhalala')
    .child("product Detail")
    .child(productName.text)
    .once()
    .then((value) => value.value["productQTY"]);
