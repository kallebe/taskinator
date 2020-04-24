import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//* Filters
final String filterTable        = "filters";
final String filterIdColumn     = "id";
final String filterTitleColumn  = "title";
final String filterColorColumn  = "color";
//* Tasks
final String tasksTable         = "tasks";
final String tasksIdColumn      = "id";
final String tasksTitleColumn   = "title";
final String tasksDeliverColumn = "deliver";
final String tasksFilterColumn  = "filter_id";

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db == null)
      _db = await initDB();

    return _db;
  }

  Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'taskinator.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $filterTable(" +
          "$filterIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "$filterTitleColumn TEXT, " +
          "$filterColorColumn TEXT)"
        );
        await db.execute(
          "CREATE TABLE $tasksTable(" +
          "$tasksIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "$tasksTitleColumn TEXT, " +
          "$tasksDeliverColumn INTEGER, " +
          "$tasksFilterColumn INTEGER, "
          "FOREIGN KEY ($tasksFilterColumn) REFERENCES $filterTable ($filterIdColumn))"
        );
      },
      version: 1
    );
  }

  Future close() async {
    Database database = await db;
    database.close();
  }
}