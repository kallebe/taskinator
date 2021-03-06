// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksStore on _TasksStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_TasksStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$tasksAtom = Atom(name: '_TasksStoreBase.tasks');

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.context.enforceReadPolicy(_$tasksAtom);
    _$tasksAtom.reportObserved();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.context.conditionallyRunInAction(() {
      super.tasks = value;
      _$tasksAtom.reportChanged();
    }, _$tasksAtom, name: '${_$tasksAtom.name}_set');
  }

  final _$fIndexAtom = Atom(name: '_TasksStoreBase.fIndex');

  @override
  int get fIndex {
    _$fIndexAtom.context.enforceReadPolicy(_$fIndexAtom);
    _$fIndexAtom.reportObserved();
    return super.fIndex;
  }

  @override
  set fIndex(int value) {
    _$fIndexAtom.context.conditionallyRunInAction(() {
      super.fIndex = value;
      _$fIndexAtom.reportChanged();
    }, _$fIndexAtom, name: '${_$fIndexAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$filterTasksAsyncAction = AsyncAction('filterTasks');

  @override
  Future filterTasks(FilterModel filter, FiltersStore filtersStore) {
    return _$filterTasksAsyncAction
        .run(() => super.filterTasks(filter, filtersStore));
  }

  final _$_TasksStoreBaseActionController =
      ActionController(name: '_TasksStoreBase');

  @override
  void addTask(TaskModel task) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction();
    try {
      return super.addTask(task);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTask(TaskModel task) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction();
    try {
      return super.updateTask(task);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(TaskModel task) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction();
    try {
      return super.removeTask(task);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},tasks: ${tasks.toString()},fIndex: ${fIndex.toString()}';
    return '{$string}';
  }
}
