import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mainContainer({context, required Widget child}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.86,
    width: MediaQuery.of(context).size.width * 1,
    margin: EdgeInsets.only(top: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    ),
    child: child,
  );
}

Widget childContainer({context, IconData? icon, String? text, Widget? route}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return route!;
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 55, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 60,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget smallContainer({context, IconData? icon, String? text, Widget? route}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return route!;
          },
        ),
      );
    },
    child: Container(
padding: EdgeInsets.symmetric(vertical: 40),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.grey),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    ),
  );
}
