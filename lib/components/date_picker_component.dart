import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:taskinator/stores/task_form_store.dart';

import 'box_shadow_component.dart';

Widget datePickerComponent(BuildContext context, {TaskForm taskForm}) {

  final DateFormat dateFormatter = DateFormat("dd/MM/yyyy");
  final DateFormat timeFormatter = DateFormat("hh'h'mm");

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Text(
        "Data de Entrega",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => _pickDate(context, taskForm: taskForm),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    boxShadow: boxShadowComponent(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Observer(builder: (_) {
                      return Text(
                          "${dateFormatter.format(taskForm.deliverDate)}");
                    }),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _pickTime(context, taskForm: taskForm),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
                margin: EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                    boxShadow: boxShadowComponent(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Theme.of(context).primaryColor,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Observer(builder: (_) {
                      TimeOfDay _selectedTime = taskForm.deliverTime;
                      return Text(
                          "${timeFormatter.format(DateTime(2020, 1, 1, _selectedTime.hour, _selectedTime.minute))}");
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Future<Null> _pickDate(BuildContext context, {TaskForm taskForm}) async {
  DateTime _now = DateTime.now();

  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _now,
      firstDate: DateTime(_now.year - 3),
      lastDate: DateTime(_now.year + 3));
  if (picked != null && picked != taskForm.deliverDate)
    taskForm.selectDate(picked);
}

Future<Null> _pickTime(BuildContext context, {TaskForm taskForm}) async {
  TimeOfDay _now = TimeOfDay.now();

  final TimeOfDay picked =
      await showTimePicker(context: context, initialTime: _now);
  if (picked != null && picked != taskForm.deliverTime)
    taskForm.selectTime(picked);
