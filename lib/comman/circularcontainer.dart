import 'package:firstproject/utiles/colors.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorContainerContainer,
        borderRadius: BorderRadius.only(
            bottomLeft: circularContainerRadius,
            bottomRight: circularContainerRadius),
      ),
    );
  }
}

Radius circularContainerRadius = Radius.circular(350);
