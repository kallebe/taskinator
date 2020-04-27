import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/stores/filters_store.dart';
import 'package:taskinator/stores/tasks_store.dart';
import 'package:taskinator/widgets/filter_element.dart';

class FilterList extends StatelessWidget {

  FilterList(this.currentFilter, this.filtersStore, this.tasksStore);
  final int currentFilter;
  final FiltersStore filtersStore;
  final TasksStore tasksStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<FilterModel> filters = filtersStore.filters;

        return SizedBox(
          height: 50.0,
          child: filtersStore.isLoading ?
            Center(child: CircularProgressIndicator(),) :
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filtersStore.filters.length + 1,
              itemBuilder: (context, index) {
                return index < filters.length ?
                  FilterElement(filtersStore, tasksStore, filter: filters[index], isSelected: index == this.currentFilter) :
                  FilterElement(filtersStore, tasksStore);
              },
            )
        );
      },
    );
  }
}