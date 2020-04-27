import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taskinator/models/filter_model.dart';
part 'filters_store.g.dart';

class FiltersStore = _FiltersStoreBase with _$FiltersStore;

abstract class _FiltersStoreBase with Store {
  _FiltersStoreBase(BuildContext context) {
    init(context);
  }

  @observable
  bool isLoading = false;

  @observable
  ObservableList<FilterModel> filters = ObservableList<FilterModel>();

  @action
  init(BuildContext context) async {
    isLoading = true;

    List<FilterModel> fs = await FilterModel.getFilters();
    if (fs == null) {
      filters = <FilterModel>[].asObservable();
    } else {
      filters = fs.asObservable();
    }

    filters.insert(0, FilterModel("Todos", Theme.of(context).accentColor));
    
    isLoading = false;
  }

  @action
  void addFilter(FilterModel filter) {
    isLoading = true;
    filters.add(filter);
    FilterModel.saveFilter(filter);
    isLoading = false;
  }

  @action
  void updateFilter(FilterModel filter) {
    isLoading = true;
    filters.add(filter);
    FilterModel.updateFilter(filter);
    isLoading = false;
  }

  @action
  void removeFilter(FilterModel filter) {
    isLoading = true;
    filters.remove(filter);
    FilterModel.deleteFilter(filter);
    isLoading = false;
  }
}