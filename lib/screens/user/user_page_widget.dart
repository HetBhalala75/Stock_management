import 'package:flutter/material.dart';

Widget circleAvatar(
    {context, required Widget routePage, required IconData icon}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return routePage;
          },
        ),
      );
    },
    child: CircleAvatar(
      radius: 70,
      backgroundColor: Colors.black,
      child: Icon(
        icon,
        size: 100,
        color: Colors.white,
      ),
    ),
  );
}
