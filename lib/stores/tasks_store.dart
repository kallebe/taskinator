import 'package:mobx/mobx.dart';
import 'package:taskinator/models/task_model.dart';
part 'tasks_store.g.dart';

class TasksStore = _TasksStoreBase with _$TasksStore;

abstract class _TasksStoreBase with Store {

  _TasksStoreBase() {
    init();
  }

  @observable
  bool isLoading = false;

  @observable
  ObservableList<TaskModel> tasks = ObservableList<TaskModel>();

  @action
  init() async {
    isLoading = true;

    List<TaskModel> ts = await TaskModel.getTasks();
    if (ts == null) {
      tasks = <TaskModel>[].asObservable();
    } else {
      tasks = ts.asObservable();
    }

    tasks.sort((a, b) => a.deliver.isAfter(b.deliver) ? 1 : 0);
    
    isLoading = false;
  }

  @action
  void addTask(TaskModel task) {
    isLoading = true;
    tasks.add(task);
    TaskModel.saveTask(task);
    isLoading = false;
  }
}