import 'package:flutter/painting.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:taskinator/helpers/filter_helper.dart';

class FilterModel extends Model {
  int _id;
  String _title;
  Color _color;

  FilterModel(this._title, this._color);

  String get title => _title;
  Color get color => _color;
  int get id => _id;

  void setId(int id) {
    this._id = id;
  }

  void save() {
    FilterHelper().createFilter(this);
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
      'color': _color.value
    };
  }

  FilterModel.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _title = data["title"];
    _color = Color(int.parse(data["color"]));
  }

  static Future<List<FilterModel>> getFilters() async {
    return await FilterHelper().getFilters();
  }

  static void saveFilter(FilterModel filter) async {
    await FilterHelper().createFilter(filter);
  }

  static void updateFilter(FilterModel filter) async {
    await FilterHelper().updateFilter(filter);
  }

  static void deleteFilter(FilterModel filter) async {
    await FilterHelper().deleteFilter(filter);
  }
}