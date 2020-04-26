import 'package:flutter/material.dart';

List<BoxShadow> boxShadowComponent({Color color}) {
  return [
    BoxShadow(
      color: color ?? Colors.grey[350],
      blurRadius: 8.0,
    )
  ];
}
