import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskinator/components/box_shadow_component.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/screens/new_task_screen.dart';
import 'package:taskinator/stores/filters_store.dart';
import 'package:taskinator/stores/tasks_store.dart';

class TaskElement extends StatelessWidget {

  TaskElement(this.task, this.tasksStore, this.filtersStore)
    : dateDeliver = DateFormat("dd MMM. H'h'mm", "pt_BR").format(task.deliver);

  final String dateDeliver;
  final TaskModel task;
  final TasksStore tasksStore;
  final FiltersStore filtersStore;

  Color alertColor() {
    if (DateTime.now().isAfter(task.deliver))
      return Colors.redAccent;
    else if (DateTime.now().isAfter(task.deliver.subtract(Duration(minutes: 30))))
      return Colors.amber;
    else
      return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart)
          tasksStore.removeTask(task);
      },
      background: Container(
        color: Theme.of(context).accentColor
      ),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewTask(filtersStore, tasksStore, task: task)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: boxShadowComponent(),
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
                          color: alertColor(),
                          size: 18.0,
                        ),
                        Text(
                          dateDeliver,  //* Data de entrega
                          style: TextStyle( color: alertColor() ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              FutureBuilder(
                future: FilterHelper().getFilter(task.filterId),
                builder: (context, snapshot) {
                  return Container(
                    width: 8.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: snapshot.hasData ? snapshot.data.color : Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(4.0)
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}