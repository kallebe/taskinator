import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/helpers/task_helper.dart';
import 'package:taskinator/models/filter_model.dart';

class TaskModel {
  int _id;
  int _filterId;
  String _title;
  DateTime _deliver;

  TaskModel(this._title, this._filterId, this._deliver);

  int get id => _id;
  int get filterId => _filterId;
  String get title => _title;
  DateTime get deliver => _deliver;

  Future<FilterModel> getFilter() async {
    return await FilterHelper().getFilter(_filterId);
  }

  void setId(int id) {
    _id = id;
  }

  void setFilterId(int filterId) {
    _filterId = filterId;
  }

  void setTitle(String title) {
    _title = title;
  }

  void setDeliver(DateTime deliver) {
    _deliver = deliver;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
      'filter_id': _filterId,
      'deliver': _deliver.millisecondsSinceEpoch
    };
  }

  TaskModel.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _title = data["title"];
    _filterId = data["filter_id"];
    _deliver = DateTime.fromMillisecondsSinceEpoch(data["deliver"]);
  }

  static Future<List<TaskModel>> getTasks() async {
    List<TaskModel> filters = await TaskHelper().getTasks();
    
    return filters;
  }

  static void saveTask(TaskModel task) async {
    await TaskHelper().createTask(task);
  }

  static void updateTask(TaskModel task) async {
    await TaskHelper().updateTask(task);
  }

  static void deleteTask(TaskModel task) async {
    await TaskHelper().deleteTask(task);
  }
}