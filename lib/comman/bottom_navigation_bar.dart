import 'package:flutter/material.dart';

Widget bottomNavigationBar(context, Widget route) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return route;
      }));
    },
    child: Container(
      height: 50,
      color: Colors.grey,
      child: Center(
        child: Text(
          "Done",
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 2,
          ),
        ),
      ),
    ),
  );
}
