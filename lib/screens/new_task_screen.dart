import 'package:flutter/material.dart';
import 'package:taskinator/components/appbar_component.dart';
import 'package:taskinator/components/date_picker_component.dart';
import 'package:taskinator/components/form_field_component.dart';
import 'package:taskinator/components/select_filter_component.dart';
import 'package:taskinator/components/text_field_component.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/stores/filters_store.dart';
import 'package:taskinator/stores/task_form_store.dart';
import 'package:taskinator/stores/tasks_store.dart';

class NewTask extends StatelessWidget {
  NewTask(this.filtersStore, this.tasksStore, {this.task});

  final TaskForm taskForm = TaskForm();
  final TasksStore tasksStore;
  final FiltersStore filtersStore;
  final TaskModel task;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      titleController.text = task.title;
      taskForm.setTitile(task.title);
      taskForm.selectTime(TimeOfDay.fromDateTime(task.deliver));
      taskForm.selectDate(task.deliver);

      FilterModel f = FilterModel('', Colors.white,);
      f.setId(task.filterId);
      taskForm.selectFilter(f);
    }

    return Scaffold(
      appBar: appBarComponent(context),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            formFieldComponent("Categoria", selectFilterComponent(filtersStore, taskForm: taskForm)),
            formFieldComponent("Título", textFieldComponent(titleController, hint: "Ex.: Avaliar Taskinator")),
            datePickerComponent(context, taskForm: taskForm),
            SizedBox(height: 16.0,),
            RaisedButton(
              onPressed: (){
                TaskModel t = TaskModel(titleController.text, taskForm.selectedFilter.id, taskForm.deliver);

                if (task != null) {
                  t.setId(task.id);
                  tasksStore.updateTask(t);
                }
                else
                  tasksStore.addTask(t);
                
                Navigator.of(context).pop();
              },
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              textColor: Colors.white,
              child: Text(task == null ? "CRIAR TAREFA" : "EDITAR TAREFA"),
            )
          ],
        )
      ),
    );
  }
}