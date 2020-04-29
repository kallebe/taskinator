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

    sortTasks();
    
    isLoading = false;
  }

  @action
  void addTask(TaskModel task) {
    isLoading = true;
    tasks.add(task);
    TaskModel.saveTask(task);
    sortTasks();
    isLoading = false;
  }

  @action
  void updateTask(TaskModel task) {
    isLoading = true;

    int idx = tasks.indexWhere((f) => f.id == task.id);
    tasks.removeAt(idx);
    tasks.insert(idx, task);

    TaskModel.updateTask(task);

    isLoading = false;
  }

  void sortTasks() {
    tasks.sort((a, b) => a.deliver.isAfter(b.deliver) ? 1 : 0);
  }

  @action
  void removeTask(TaskModel task) {
    isLoading = true;
    tasks.remove(task);
    TaskModel.deleteTask(task);
    sortTasks();
    isLoading = false;
  }
}