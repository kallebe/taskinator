// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FiltersStore on _FiltersStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_FiltersStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$filtersAtom = Atom(name: '_FiltersStoreBase.filters');

  @override
  ObservableList<FilterModel> get filters {
    _$filtersAtom.context.enforceReadPolicy(_$filtersAtom);
    _$filtersAtom.reportObserved();
    return super.filters;
  }

  @override
  set filters(ObservableList<FilterModel> value) {
    _$filtersAtom.context.conditionallyRunInAction(() {
      super.filters = value;
      _$filtersAtom.reportChanged();
    }, _$filtersAtom, name: '${_$filtersAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init(BuildContext context) {
    return _$initAsyncAction.run(() => super.init(context));
  }

  final _$_FiltersStoreBaseActionController =
      ActionController(name: '_FiltersStoreBase');

  @override
  void addFilter(FilterModel filter) {
    final _$actionInfo = _$_FiltersStoreBaseActionController.startAction();
    try {
      return super.addFilter(filter);
    } finally {
      _$_FiltersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFilter(FilterModel filter) {
    final _$actionInfo = _$_FiltersStoreBaseActionController.startAction();
    try {
      return super.updateFilter(filter);
    } finally {
      _$_FiltersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFilter(FilterModel filter) {
    final _$actionInfo = _$_FiltersStoreBaseActionController.startAction();
    try {
      return super.removeFilter(filter);
    } finally {
      _$_FiltersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},filters: ${filters.toString()}';
    return '{$string}';
  }
}
