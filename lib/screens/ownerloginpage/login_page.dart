import 'package:firstproject/comman/circularcontainer.dart';
import 'package:firstproject/comman/textbutton.dart';
import 'package:firstproject/screens/register/register_page.dart';
import 'package:firstproject/utiles/text.dart';

import 'package:flutter/material.dart';

import 'login_page_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularContainer(),
                LoginContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
