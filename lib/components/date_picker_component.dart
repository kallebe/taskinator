import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'box_shadow_component.dart';

Widget datePickerComponent(BuildContext context) {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

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
              onTap: () => _pickDate(context, _selectedDate),
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
                    Text("${dateFormatter.format(_selectedDate)}"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _pickTime(context, _selectedTime),
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
                    Text(
                        "${timeFormatter.format(DateTime(2020, 1, 1, _selectedTime.hour, _selectedTime.minute))}"),
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

Future<Null> _pickDate(BuildContext context, DateTime selectedDate) async {
  DateTime _now = DateTime.now();

  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _now,
      firstDate: DateTime(_now.year - 3),
      lastDate: DateTime(_now.year + 3));
  // if (picked != null && picked != selectedDate)
  // setState(() {
  //   selectedDate = picked;
  // });
}

Future<Null> _pickTime(BuildContext context, TimeOfDay _) async {
  TimeOfDay _now = TimeOfDay.now();

  final TimeOfDay picked =
      await showTimePicker(context: context, initialTime: _now);
  // if (picked != null && picked != selectedDate)
  // setState(() {
  //   selectedDate = picked;
  // });
}
