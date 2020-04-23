import 'package:flutter/material.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/widgets/task_element.dart';

class TasksList extends StatelessWidget {

  List<TaskModel> tasks = [
    TaskModel("Terminar de desenvolver o Taskinator",
      FilterModel('Metas', Colors.amber),
      DateTime(2020, 4, 25, 18, 0)),
    TaskModel("Comprar um Piano",
      FilterModel('Shopping', Colors.teal),
      DateTime(2020, 4, 25, 18, 0)),
    TaskModel("Fazer listas de Processamento Digital de Imagens",
      FilterModel('Estudo', Colors.blueAccent),
      DateTime(2020, 4, 25, 18, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Próximas tarefas', //TODO: Checar se lista está vazia
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24.0),
            ),
            SizedBox(height: 18.0),
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskElement(tasks[index]);
                },
                separatorBuilder: (context, _) {
                  return SizedBox(height: 8.0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
