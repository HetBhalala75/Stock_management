import 'package:firstproject/comman/materialbutton.dart';
import 'package:firstproject/comman/textformfields.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/screens/ownerloginpage/login_page.dart';
import 'package:firstproject/screens/register/register_page_widget.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController confirmedPasswordController = TextEditingController();
GlobalKey<FormState> passwordKey = GlobalKey();

class PasswordContainer extends StatefulWidget {
  @override
  _PasswordContainerState createState() => _PasswordContainerState();
}

class _PasswordContainerState extends State<PasswordContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: passwordKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              passwordHeadingText("Enter Password"),
              SizedBox(
                height: 30,
              ),
              textFormFields(
                  "password ", passwordController, TextInputType.name),
              SizedBox(
                height: 30,
              ),
              textFormFields("confirmed password ", confirmedPasswordController,
                  TextInputType.name),
              SizedBox(
                height: 30,
              ),
              materialButton(
                  onPressed: () {
                    if (passwordKey.currentState!.validate() == true) {
                      if (passwordController.text ==
                          confirmedPasswordController.text) {
                        db
                            .child('register')
                            .child(
                                '${firstNameController.text + lastNameController.text}')
                            .child('userprofile')
                            .set({
                          'firstname': firstNameController.text,
                          'lastname': lastNameController.text,
                          'emailid': emailController.text,
                          'mobilenNo': mobileNoNameController.text,
                          "password": passwordController.text,
                        });

                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: normalText(
                                "password and confirmed password are not same")));
                      }
                      firstNameController.clear();
                      lastNameController.clear();
                      emailController.clear();
                      mobileNoNameController.clear();
                      passwordController.clear();
                      confirmedPasswordController.clear();
                    } else {
                      passwordKey.currentState!.validate();
                    }
                  },
                  text: "Register")
            ],
          ),
        ),
      ),
    );
  }
}
