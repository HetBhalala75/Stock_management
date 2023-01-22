import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/network/shared_prefs.dart';
import 'package:firstproject/network/userdata.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

import 'login_page_widget.dart';

loginValidation(context) async {
  if (ownerLoginKey.currentState!.validate() == true) {
    loginDatabasePath(loginPageUserController.text).once().then((value) {
      if (value.exists) {
        loginDatabasePath(loginPageUserController.text)
            .child('userprofile')
            .once()
            .then((value) async {
          if (value.value['password'] == loginPagePasswordController.text) {
            await usenamefunc1();
            sharedPrefs(context);
            loginPageUserController.clear();
            loginPagePasswordController.clear();
          } else {
            errorMessage(context);
          }
        });
      } else {
        errorMessage(context);
      }
    });
  }
}

errorMessage(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: normalText("username or password are  incorrect"),
    ),
  );
}
