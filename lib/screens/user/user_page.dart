import 'package:firstproject/comman/circularcontainer.dart';
import 'package:firstproject/network/shared_prefs.dart';
import 'package:firstproject/screens/empoloyeeloginpage/employee_login.dart';
import 'package:firstproject/screens/ownerloginpage/login_page.dart';
import 'package:firstproject/screens/user/user_page_widget.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    validation(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: [
                CircularContainer(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        headingText("Who are you ?"),
                        SizedBox(
                          height: 30,
                        ),
                        circleAvatar(
                            context: context,
                            routePage: LoginPage(),
                            icon: Icons.person),
                        SizedBox(
                          height: 20,
                        ),
                        userPageText("owner"),
                        SizedBox(
                          height: 30,
                        ),
                        circleAvatar(
                            context: context,
                            routePage: EmployeeLoginPage(),
                            icon: Icons.people),
                        SizedBox(
                          height: 20,
                        ),
                        userPageText("Employee"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
