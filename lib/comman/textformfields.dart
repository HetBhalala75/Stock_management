import 'package:firstproject/utiles/colors.dart';

import 'package:flutter/material.dart';

Widget textFormFields(String text, TextEditingController controller,
    TextInputType textInputType) {
  return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: (val) {
        if (val!.isEmpty) {
          return "Fill the textField";
        }
      },
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: textFormFieldRadius,
            borderSide: BorderSide(color: colorTextFormField)),
        focusedBorder: OutlineInputBorder(
            borderRadius: textFormFieldRadius,
            borderSide: BorderSide(color: colorTextFormField)),
        border: OutlineInputBorder(
            borderRadius: textFormFieldRadius,
            borderSide: BorderSide(color: colorTextFormField)),
      ));
}

BorderRadius textFormFieldRadius = BorderRadius.circular(50);
