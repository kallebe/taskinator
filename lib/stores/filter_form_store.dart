import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'filter_form_store.g.dart';

class FilterForm = _FilterFormBase with _$FilterForm;

abstract class _FilterFormBase with Store {
  @observable
  Color color = Colors.red;

  @observable
  String title = "";

  @action
  void setColor(Color c) => color = c;

  @action
  void setTitle(String t) => title = t;

  @computed
  bool get isTitleValidated {
    return title.length > 0;
  }
}