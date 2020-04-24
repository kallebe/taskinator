import 'package:sqflite/sqflite.dart';
import 'package:taskinator/helpers/db_helper.dart';
import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/filter_model.dart';
import 'package:taskinator/models/task_model.dart';

class TaskHelper {
  static TaskHelper _instance;
  factory TaskHelper() => _instance ??= new TaskHelper._();

  TaskHelper._();

  Future<TaskModel> createTask(TaskModel task) async {
    Database database = await DbHelper.internal().db;
    int id = await database.insert(tasksTable, task.toMap());
    task.setId(id);
    return task;
  }

  Future<TaskModel> getTask(int id) async {
    Database database = await DbHelper.internal().db;
    List<Map> maps = await database.query(
      tasksTable,
      columns: [tasksIdColumn, tasksTitleColumn, tasksDeliverColumn, tasksFilterColumn],
      where: "$tasksIdColumn = ?",
      whereArgs: [id]
    );

    if (maps.length > 0)
      return TaskModel.fromMap(maps.first);
    else
      return null;
  }

  Future<bool> deleteTask(TaskModel task) async {
    Database database = await DbHelper.internal().db;
    int rows = await database.delete(
      tasksTable,
      where: "$tasksIdColumn = ?",
      whereArgs: [task.id]
    );
    return rows > 0;
  }

  Future<bool> updateTask(TaskModel task) async {
    Database database = await DbHelper.internal().db;
    int rows = await database.update(
      tasksTable,
      task.toMap(),
      where: "$tasksIdColumn = ?",
      whereArgs: [task.id]
    );
    return rows > 0;
  }

  Future<List<TaskModel>> getTasks() async {
    Database database = await DbHelper.internal().db;
    List<TaskModel> tasks = [];
    List<Map<String, dynamic>> maps = await database.rawQuery(
      "SELECT * from $tasksTable ORDER BY $tasksDeliverColumn DESC"
    );
    maps.forEach((map) {
      tasks.add(TaskModel.fromMap(map));
    });

    return tasks;
  }
}