import 'package:firstproject/comman/circularcontainer.dart';
import 'package:flutter/material.dart';

import 'emoloyee_login_widget.dart';


class EmployeeLoginPage extends StatefulWidget {
  @override
  EmployeeLoginPageState createState() => EmployeeLoginPageState();
}

class EmployeeLoginPageState extends State<EmployeeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CircularContainer(), LoginContainer()],
        ),

      ),
    );
  }
}
