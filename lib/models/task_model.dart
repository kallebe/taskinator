import 'package:taskinator/helpers/filter_helper.dart';
import 'package:taskinator/models/filter_model.dart';

class TaskModel {
  int id;
  String title;
  FilterModel filter;
  DateTime deliver;

  TaskModel(this.title, this.filter, this.deliver);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'filter_id': filter.id,
      'deliver': deliver.millisecondsSinceEpoch
    };
  }

  TaskModel.fromMap(Map<String, dynamic> data) {
    FilterHelper helper = new FilterHelper();
    id = data["id"];
    title = data["title"];
    //filter = data["filter_id"];
    deliver = DateTime.fromMillisecondsSinceEpoch(data["deliver"]);
  }
}