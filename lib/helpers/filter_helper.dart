import 'package:sqflite/sqflite.dart';
import 'package:taskinator/helpers/db_helper.dart';
import 'package:taskinator/models/filter_model.dart';

class FilterHelper {
  static FilterHelper _instance;
  factory FilterHelper() => _instance ??= new FilterHelper._();

  FilterHelper._();

  Future<FilterModel> createFilter(FilterModel filter) async {
    Database database = await DbHelper.internal().db;
    int id = await database.insert(filterTable, filter.toMap());
    filter.setId(id);
    return filter;
  }

  Future<FilterModel> getFilter(int id) async {
    Database database = await DbHelper.internal().db;
    List<Map> maps = await database.query(
      filterTable,
      columns: [filterIdColumn, filterTitleColumn, filterColorColumn],
      where: "$filterIdColumn = ?",
      whereArgs: [id]
    );
    
    if (maps.length > 0)
      return FilterModel.fromMap(maps.first);
    else
      return null;
  }

  Future<bool> deleteFilter(FilterModel filter) async {
    Database database = await DbHelper.internal().db;
    int rows = await database.delete(
      filterTable,
      where: "$filterIdColumn = ?",
      whereArgs: [filter.id]
    );
    return rows > 0;
  }

  Future<bool> updateFilter(FilterModel filter) async {
    Database database = await DbHelper.internal().db;
    int rows = await database.update(
      filterTable,
      filter.toMap(),
      where: "$filterIdColumn = ?",
      whereArgs: [filter.id]
    );
    return rows > 0;
  }

  Future<List<FilterModel>> getFilters() async {
    Database database = await DbHelper.internal().db;
    List<FilterModel> filters = [];
    List<Map<String, dynamic>> maps = await database.rawQuery(
      "SELECT * from $filterTable ORDER BY $filterTitleColumn"
    );
    maps.forEach((map) {
      filters.add(FilterModel.fromMap(map));
    });

    return filters;
  }
}