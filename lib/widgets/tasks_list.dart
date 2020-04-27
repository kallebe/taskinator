import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskinator/stores/tasks_store.dart';
import 'package:taskinator/widgets/task_element.dart';

class TasksList extends StatelessWidget {

  TasksList(this.tasksStore);

  final TasksStore tasksStore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  tasksStore.tasks.isEmpty
                      ? "Crie uma nova tarefa!"
                      : 'Próximas tarefas',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.0),
                ),
              ),
              SizedBox(height: 18.0),
              Expanded(
                child: tasksStore.isLoading ?
                Center(child: CircularProgressIndicator(),) :
                ListView.separated(
                  itemCount: tasksStore.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskElement(tasksStore.tasks[index], tasksStore);
                  },
                  separatorBuilder: (context, _) {
                    return SizedBox(height: 8.0);
                  }
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
