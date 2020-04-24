import 'package:flutter/material.dart';
import 'package:taskinator/helpers/task_helper.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/widgets/filter_element.dart';

class FilterList extends StatelessWidget {

  final int currentFilter;

  FilterList(this.currentFilter);

  @override
  Widget build(BuildContext context) {

    // List<FilterModel> filters = [
    //   FilterModel('Todos', Theme.of(context).accentColor),
    //   FilterModel('Estudo', Colors.blueAccent),
    //   FilterModel('Hobbies', Colors.orange),
    //   FilterModel('Shopping', Colors.teal),
    //   FilterModel('Metas', Colors.amber),
    // ];

    return SizedBox(
      height: 50.0,
      child: FutureBuilder(
        future: TaskHelper().getFilters(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return FilterElement(snapshot.data[index], index == this.currentFilter);
              },
            );
          }
        },
      ),
    );
  }
}