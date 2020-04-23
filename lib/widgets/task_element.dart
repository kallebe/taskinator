import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:taskinator/components/my_box_shadow.dart';
import 'package:taskinator/models/task_model.dart';

class TaskElement extends StatelessWidget {

  TaskElement(this.task) : dateDeliver = DateFormat("dd MMM. H'h'mm", "pt_BR").format(task.deliver);

  final String dateDeliver;

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: MyBoxShadow(),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  task.title, //* Título da tarefa
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black87
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    Text(
                      dateDeliver,  //* Data de entrega
                      style: TextStyle( color: Colors.grey ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 8.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: task.filter.color,
              borderRadius: BorderRadius.circular(4.0)
            ),
          )
        ],
      ),
    );
  }
}