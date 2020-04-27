import 'package:flutter/material.dart';
import 'package:taskinator/stores/filter_form_store.dart';
import 'package:taskinator/stores/task_form_store.dart';

Widget textFieldComponent(TextEditingController controller, {String hint, FilterForm filterForm, TaskForm taskForm}) {
  return TextField(
    controller: controller,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      hintText: hint ?? "",
      border: InputBorder.none,
    ),
  );
}