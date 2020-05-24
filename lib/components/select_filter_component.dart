import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/stores/filters_store.dart';
import 'package:taskinator/stores/task_form_store.dart';

Widget selectFilterComponent(FiltersStore filtersStore, {TaskForm taskForm}) {
  List<FilterModel> filters = filtersStore.filters;

  return Observer(builder: (_) {
    return DropdownButton(
      onChanged: (filterId) {
        FilterModel filter = filters.firstWhere((f) => f.id == filterId);
        taskForm.selectFilter(filter);
      },
      underline: SizedBox(
        height: 0,
      ),
      value: taskForm.selectedFilter.id ?? filters[0].id,
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
