import 'package:flutter/material.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/filter_model.dart';

Widget selectFilterComponent() {
  List<FilterModel> filters = [];
  
  return FutureBuilder(
    future: FilterHelper().getFilters(),
    builder: (context, snapshot) {
      if (!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      else {
        snapshot.data.forEach((f) => filters.add(f));
        return DropdownButton(
          onChanged: (_) {},
          hint: Text("Escolha uma categoria"),
          isExpanded: true,
          items: filters.map((filter) {
            return DropdownMenuItem<int>(
              value: filter.id,
              child: Text(filter.title),
            );
          }).toList(),
        );
      }
    },
  );
}
