import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/stores/task_form_store.dart';

Widget selectFilterComponent({TaskForm taskForm}) {
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
        return Observer(builder: (_) {
          return DropdownButton(
            onChanged: (filterId) {
              FilterModel filter = filters.firstWhere((f) => f.id == filterId);
              taskForm.selectFilter(filter);
            },
            underline: SizedBox(
              height: 0,
            ),
            value: taskForm.selectedFilter.id ?? filters[1].id,
            isExpanded: true,
            items: filters.map((filter) {
              return DropdownMenuItem<int>(
                value: filter.id,
                child: Text(filter.title),
              );
            }).toList(),
          );
        });
      }
    },
  );
}
