import 'package:flutter/material.dart';
import 'package:taskinator/components/box_shadow_component.dart';

Widget formFieldComponent(String text, Widget child) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      Flexible(
        flex: 3,
        child: Container(
            margin: EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            decoration: BoxDecoration(
                boxShadow: boxShadowComponent(),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
            ),
          child: child
        ),
      )
    ],
  );
}
