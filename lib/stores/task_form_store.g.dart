// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskForm on _TaskFormBase, Store {
  Computed<DateTime> _$deliverComputed;

  @override
  DateTime get deliver =>
      (_$deliverComputed ??= Computed<DateTime>(() => super.deliver)).value;

  final _$deliverDateAtom = Atom(name: '_TaskFormBase.deliverDate');

  @override
  DateTime get deliverDate {
    _$deliverDateAtom.context.enforceReadPolicy(_$deliverDateAtom);
    _$deliverDateAtom.reportObserved();
    return super.deliverDate;
  }

  @override
  set deliverDate(DateTime value) {
    _$deliverDateAtom.context.conditionallyRunInAction(() {
      super.deliverDate = value;
      _$deliverDateAtom.reportChanged();
    }, _$deliverDateAtom, name: '${_$deliverDateAtom.name}_set');
  }

  final _$deliverTimeAtom = Atom(name: '_TaskFormBase.deliverTime');

  @override
  TimeOfDay get deliverTime {
    _$deliverTimeAtom.context.enforceReadPolicy(_$deliverTimeAtom);
    _$deliverTimeAtom.reportObserved();
    return super.deliverTime;
  }

  @override
  set deliverTime(TimeOfDay value) {
    _$deliverTimeAtom.context.conditionallyRunInAction(() {
      super.deliverTime = value;
      _$deliverTimeAtom.reportChanged();
    }, _$deliverTimeAtom, name: '${_$deliverTimeAtom.name}_set');
  }

  final _$selectedFilterAtom = Atom(name: '_TaskFormBase.selectedFilter');

  @override
  FilterModel get selectedFilter {
    _$selectedFilterAtom.context.enforceReadPolicy(_$selectedFilterAtom);
    _$selectedFilterAtom.reportObserved();
    return super.selectedFilter;
  }

  @override
  set selectedFilter(FilterModel value) {
    _$selectedFilterAtom.context.conditionallyRunInAction(() {
      super.selectedFilter = value;
      _$selectedFilterAtom.reportChanged();
    }, _$selectedFilterAtom, name: '${_$selectedFilterAtom.name}_set');
  }

  final _$_TaskFormBaseActionController =
      ActionController(name: '_TaskFormBase');

  @override
  dynamic selectDate(DateTime date) {
    final _$actionInfo = _$_TaskFormBaseActionController.startAction();
    try {
      return super.selectDate(date);
    } finally {
      _$_TaskFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTime(TimeOfDay time) {
    final _$actionInfo = _$_TaskFormBaseActionController.startAction();
    try {
      return super.selectTime(time);
    } finally {
      _$_TaskFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectFilter(FilterModel filter) {
    final _$actionInfo = _$_TaskFormBaseActionController.startAction();
    try {
      return super.selectFilter(filter);
    } finally {
      _$_TaskFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'deliverDate: ${deliverDate.toString()},deliverTime: ${deliverTime.toString()},selectedFilter: ${selectedFilter.toString()},deliver: ${deliver.toString()}';
    return '{$string}';
  }
}
