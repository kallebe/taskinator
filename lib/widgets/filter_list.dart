import 'package:flutter/material.dart';
import 'package:taskinator/widgets/filter_element.dart';

class FilterList extends StatelessWidget {

  final int currentFilter;

  FilterList(this.currentFilter);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          FilterElement('Todos', true),
          FilterElement('Estudo', false),
          FilterElement('Hobbies', false),
          FilterElement('Shopping', false),
          FilterElement('Metas', false),
        ],
      ),
    );
  }
}