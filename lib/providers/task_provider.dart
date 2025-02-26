import 'package:flutter/material.dart';
import 'package:testprovider/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners(); // Notity Listeners to rebuild UI
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}
