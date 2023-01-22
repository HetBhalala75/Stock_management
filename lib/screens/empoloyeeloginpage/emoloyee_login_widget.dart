import 'package:firstproject/comman/materialbutton.dart';
import 'package:firstproject/comman/textformfields.dart';

import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

TextEditingController emLoginPageUserController = TextEditingController();
TextEditingController emLoginPagePasswordController = TextEditingController();

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.62,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            passwordHeadingText("Employee Login"),
            textFormFields("Owner Id", emLoginPageUserController,TextInputType.name),
            textFormFields("Employee Id", emLoginPagePasswordController,TextInputType.name),
            materialButton(text: "LOGIN", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
