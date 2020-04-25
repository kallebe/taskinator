import 'package:flutter/material.dart';
import 'my_box_shadow.dart';

Widget formFieldComponent(String text, Widget child) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Flexible(
        flex: 3,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            decoration: BoxDecoration(
                boxShadow: MyBoxShadow(),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: child),
      )
    ],
  );
}
