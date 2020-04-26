import 'package:flutter/material.dart';

Widget textFieldComponent(TextEditingController controller, {String hint}) {
  return TextField(
    controller: controller,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      hintText: hint ?? "",
      border: InputBorder.none,
    ),
  );
}