import 'package:firstproject/screens/user/user_page.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor:backGroundColor,
          body: User()
        ),
      ),
    ),
  );
}
