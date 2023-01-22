import 'package:flutter/material.dart';
Widget containertext(String text){
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: 15),
    ),
  );
}