import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taskinator/components/my_appbar.dart';
import 'package:taskinator/helpers/task_helper.dart';
import 'package:taskinator/models/task_model.dart';
import 'package:taskinator/screens/new_task_screen.dart';
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewTask()
          ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: myAppBar(context),
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