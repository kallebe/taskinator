import 'package:taskinator/models/filter_model.dart';

class TaskModel {
  String _title;
  FilterModel _filter;
  DateTime _deliver;

  TaskModel(this._title, this._filter, this._deliver);

  String get title => _title;
  FilterModel get filter => _filter;
  DateTime get deliver => _deliver;
}