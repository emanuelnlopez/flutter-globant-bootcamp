import 'package:flutter/material.dart';
import 'package:provider_todo_list/src/model/task.dart';

class TaskListState extends ChangeNotifier {
  final _tasks = <Task>[];

  List<Task> get tasks => _tasks;

  int _getIndex(Task task) => _tasks.indexWhere(
        (oldTask) => oldTask.id == task.id,
      );

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void update(Task task) {
    _tasks[_getIndex(task)] = task;
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.removeAt(_getIndex(task));
    notifyListeners();
  }

  void toggle(Task task) {
    _tasks[_getIndex(task)] = task.copyWith(done: !task.done);
    notifyListeners();
  }
}
