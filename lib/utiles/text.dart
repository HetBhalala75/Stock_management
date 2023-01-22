import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget headingText(String text) => Text(text,
  style: TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,

  ),
);
Widget passwordHeadingText(String text) => Text(text,
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,

  ),
);
Widget userPageText(String text) => Text(text,
  style: TextStyle(
    color:Colors.grey,
    fontSize: 30,
    fontWeight: FontWeight.bold,

  ),
);

Widget normalText(String text) => Text(text,
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal

  ),
);

