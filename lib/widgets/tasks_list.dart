import 'package:flutter/material.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/widgets/task_element.dart';

class TasksList extends StatelessWidget {

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
              child: FutureBuilder(
                future: TaskModel.getTasks(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData && snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator(),);
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('Adicione uma nova Tarefa'));
                  } else {
                    return ListView.separated(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        print(snapshot.data[index]);
                        return TaskElement(snapshot.data[index]);
                      },
                      separatorBuilder: (context, _) {
                        return SizedBox(height: 8.0);
                      }
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
