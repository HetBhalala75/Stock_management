import 'package:firstproject/network/userdata.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/home/home_page.dart';
import 'package:firstproject/screens/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String login="";

sharedPrefs(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(login, "success");
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ),
  );
  await getDataFromDB();
  await getCustomerDataFromdb();
}

validation(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var strings1 = prefs.get(login);
  if (strings1 == "success") {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
    getDataFromDB();
    getCustomerDataFromdb();
  }
}

sharedPrefs3(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(login, "logout");
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return User();
      },
    ),
  );
}
