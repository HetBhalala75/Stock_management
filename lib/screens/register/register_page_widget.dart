import 'package:firstproject/comman/materialbutton.dart';
import 'package:firstproject/comman/textformfields.dart';
import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/screens/password/password_page.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileNoNameController = TextEditingController();
GlobalKey<FormState> registerKey = GlobalKey();

class RegisterContainer extends StatefulWidget {
  @override
  _RegisterContainerState createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: registerKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              headingText("Registration"),
              SizedBox(height: 20),
              textFormFields(
                  "first name ", firstNameController, TextInputType.name),
              SizedBox(height: 20),
              textFormFields(
                  "Last name ", lastNameController, TextInputType.name),
              SizedBox(height: 20),
              textFormFields(
                  "email ID ", emailController, TextInputType.emailAddress),
              SizedBox(height: 20),
              textFormFields(
                  "Mobile NO. ", mobileNoNameController, TextInputType.number),
              SizedBox(height: 20),
              materialButton(
                  onPressed: () {
                    if (registerKey.currentState!.validate() == true) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Password();
                      }));
                    } else {
                      registerKey.currentState!.validate();
                    }
                  },
                  text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
