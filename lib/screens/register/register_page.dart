import 'package:firstproject/comman/circularcontainer.dart';
import 'package:firstproject/comman/materialbutton.dart';
import 'package:firstproject/comman/textformfields.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/screens/password/password_page.dart';
import 'package:firstproject/screens/register/register_page_widget.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularContainer(),
                SizedBox(height: 30),
                RegisterContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
