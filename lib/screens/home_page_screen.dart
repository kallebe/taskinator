import 'package:flutter/material.dart';
import 'package:taskinator/widgets/filter_list.dart';
import 'package:taskinator/widgets/tasks_list.dart';

class HomePage extends StatelessWidget {

  final PageController filterController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          TasksList('')
        ],
      ),
    );
  }
}