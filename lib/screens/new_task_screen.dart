import 'package:flutter/material.dart';
import 'package:taskinator/components/form_field_component.dart';
import 'package:taskinator/components/my_appbar.dart';
import 'package:taskinator/components/my_box_shadow.dart';
import 'package:taskinator/components/select_filter_component.dart';
import 'package:taskinator/components/text_field_component.dart';

class NewTask extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              formFieldComponent("Categorias", selectFilterComponent()),
              formFieldComponent("Título", textFieldComponent(titleController)),
            ],
          )
        ),
      ),
    );
  }
}