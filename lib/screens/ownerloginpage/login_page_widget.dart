import 'package:firstproject/comman/materialbutton.dart';
import 'package:firstproject/comman/textbutton.dart';
import 'package:firstproject/comman/textformfields.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/network/shared_prefs.dart';
import 'package:firstproject/screens/addproduct/add_product_widget.dart';
import 'package:firstproject/screens/register/register_page.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

import 'login_onpressed.dart';

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

TextEditingController loginPageUserController = TextEditingController();
TextEditingController loginPagePasswordController = TextEditingController();
GlobalKey<FormState> ownerLoginKey = GlobalKey();

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: ownerLoginKey,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              headingText("LOGIN"),
              SizedBox(
                height: 30,
              ),
              textFormFields(
                  "UserName", loginPageUserController, TextInputType.name),
              SizedBox(
                height: 30,
              ),
              textFormFields(
                  "password", loginPagePasswordController, TextInputType.name),
              SizedBox(
                height: 30,
              ),
              materialButton(
                text: "LOGIN",
                onPressed: () {
                  loginValidation(context);
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalText("Don't have an account ?"),
                  textButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
