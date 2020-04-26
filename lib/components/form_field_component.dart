import 'package:flutter/material.dart';
import 'package:taskinator/components/box_shadow_component.dart';

Widget formFieldComponent(String text, Widget child) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      Container(
          margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          decoration: BoxDecoration(
              boxShadow: boxShadowComponent(),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
          ),
        child: child
      )
    ],
  );
}
