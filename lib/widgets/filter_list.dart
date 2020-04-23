import 'package:flutter/material.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/widgets/filter_element.dart';

class FilterList extends StatelessWidget {

  final int currentFilter;

  FilterList(this.currentFilter);

  @override
  Widget build(BuildContext context) {

    List<FilterModel> filters = [
      FilterModel('Todos', Theme.of(context).accentColor),
      FilterModel('Estudo', Colors.blueAccent),
      FilterModel('Hobbies', Colors.orange),
      FilterModel('Shopping', Colors.teal),
      FilterModel('Metas', Colors.amber),
    ];

    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return FilterElement(filters[index], index == this.currentFilter);
        },
      ),
    );
  }
}