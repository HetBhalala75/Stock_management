import 'package:firstproject/comman/circularcontainer.dart';
import 'package:firstproject/screens/password/password_page_widget.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                CircularContainer(),
                SizedBox(height: 50),
                PasswordContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
