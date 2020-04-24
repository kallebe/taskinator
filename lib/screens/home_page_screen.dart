import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/helpers/task_helper.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/widgets/filter_list.dart';
import 'package:taskinator/widgets/tasks_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  final PageController filterController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          TaskHelper().createTask(TaskModel("Fazer lista de PDI", 0, DateTime.now()));
          TaskHelper().getTasks().then((list) => print(list.toString()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AppBar(
              title: Image.asset(
                'assets/logo-horizontal.png',
                fit: BoxFit.scaleDown,
                height: 50.0,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FilterList(0),
          SizedBox(height: 20.0),
          TasksList()
        ],
      ),
    );
  }
}