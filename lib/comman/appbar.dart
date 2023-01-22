import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

Widget appbar(
    {IconData? leadingIcon,
    String centerText = "",
    IconData? actionIcon,
    void Function()? onPressed,
    void Function()? onPressed1}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressed1,
          icon: Icon(
            leadingIcon,
            size: 35,
          ),
          color: appbarTextAndIconColor,
        ),
        Text(
          centerText,
          style: TextStyle(
              color: appbarTextAndIconColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            actionIcon,
            size: 30,
          ),
          color: appbarTextAndIconColor,
        )
      ],
    ),
  );
}
