import 'package:firstproject/comman/textformfields.dart';
import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget materialButton({String text='',required void Function()? onPressed }) {
  return MaterialButton(
    height: 55,
    onPressed: onPressed,
    child: SizedBox(
      width: 170,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            letterSpacing: 2),
      ),
    ),
    color: colorMaterialButton,
    shape: RoundedRectangleBorder(
      borderRadius: textFormFieldRadius,
    ),
  );
}
