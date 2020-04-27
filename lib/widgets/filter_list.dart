import 'package:flutter/material.dart';
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
        future: FilterModel.getFilters(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            List<FilterModel> filters = snapshot.data;
            filters.insert(0, FilterModel("Todos", Theme.of(context).accentColor));

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length + 1,
              itemBuilder: (context, index) {
                return index < filters.length ?
                  FilterElement(filter: filters[index], isSelected: index == this.currentFilter) :
                  FilterElement();
              },
            );
          }
        },
      ),
    );
  }
}