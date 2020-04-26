import 'package:flutter/material.dart';
import 'package:taskinator/components/appbar_component.dart';
import 'package:taskinator/components/date_picker_component.dart';
import 'package:taskinator/components/form_field_component.dart';
import 'package:taskinator/components/select_filter_component.dart';
import 'package:taskinator/components/text_field_component.dart';

class NewTask extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              formFieldComponent("Categoria", selectFilterComponent()),
              formFieldComponent("Título", textFieldComponent(titleController, hint: "Ex.: Avaliar Taskinator")),
              datePickerComponent(context),
              SizedBox(height: 16.0,),
              RaisedButton(
                onPressed: (){},
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textColor: Colors.white,
                child: Text("CRIAR TAREFA"),
              )
            ],
          )
        ),
      ),
    );
  }
}