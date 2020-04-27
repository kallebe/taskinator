import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taskinator/models/filter_model.dart';
part 'task_form_store.g.dart';

class TaskForm = _TaskFormBase with _$TaskForm;

abstract class _TaskFormBase with Store {
  @observable
  DateTime deliverDate = DateTime.now();

  @observable
  TimeOfDay deliverTime = TimeOfDay.now();

  @observable
  FilterModel selectedFilter = FilterModel('', Colors.white);

  @action
  selectDate(DateTime date) => deliverDate = date;

  @action
  selectTime(TimeOfDay time) => deliverTime = time;

  @action
  selectFilter(FilterModel filter) => selectedFilter = filter;

  @computed
  DateTime get deliver => DateTime(
    deliverDate.year,
    deliverDate.month,
    deliverDate.day,
    deliverTime.hour,
    deliverTime.minute
  );
}