import 'package:flutter/material.dart';
import 'package:taskinator/widgets/task_element.dart';

class TasksList extends StatelessWidget {
  TasksList(this.filter);

  final String filter; //TODO: Mudar para objeto

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(  //? is Listview a better option?
            //TODO: Mudar para lista dinâmica
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TaskElement("Criar Aplicativo com Flutter"),
              SizedBox(height: 16.0,),
              TaskElement("Estudar PDI"),
              SizedBox(height: 16.0,)
            ],
          )
        ],
      ),
    );
  }
}
