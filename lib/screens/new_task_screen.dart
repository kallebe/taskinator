import 'package:flutter/material.dart';
import 'package:taskinator/components/appbar_component.dart';
import 'package:taskinator/components/date_picker_component.dart';
import 'package:taskinator/components/form_field_component.dart';
import 'package:taskinator/components/select_filter_component.dart';
import 'package:taskinator/components/text_field_component.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/stores/task_form_store.dart';
import 'package:taskinator/stores/tasks_store.dart';

class NewTask extends StatelessWidget {
  final TaskForm taskForm = TaskForm();
  final TasksStore tasksStore = TasksStore();

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            formFieldComponent("Categoria", selectFilterComponent(taskForm: taskForm)),
            formFieldComponent("Título", textFieldComponent(titleController, hint: "Ex.: Avaliar Taskinator")),
            datePickerComponent(context, taskForm: taskForm),
            SizedBox(height: 16.0,),
            RaisedButton(
              onPressed: (){
                TaskModel task = TaskModel(titleController.text, taskForm.selectedFilter.id, taskForm.deliver);
                tasksStore.addTask(task);
                Navigator.of(context).pop();
              },
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              textColor: Colors.white,
              child: Text("CRIAR TAREFA"),
            )
          ],
        )
      ),
    );
  }
}