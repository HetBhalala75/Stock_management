import 'package:firstproject/screens/register/register_page.dart';
import 'package:firstproject/utiles/text.dart';
import 'package:flutter/material.dart';

Widget textButton({String? text, void Function()? onPressed}) {
  return TextButton(onPressed: onPressed, child: normalText(text!));
}
