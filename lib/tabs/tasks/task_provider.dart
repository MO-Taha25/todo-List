import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> taskList = [];
  DateTime selectedDate = DateTime.now();
  Future<void> gitTask() async {
    List<TaskModel> allTask = await FirebaseFunctions.gitTaskFromFireStore();
    taskList = allTask
        .where((taskList) =>
            taskList.date.year == selectedDate.year &&
            taskList.date.month == selectedDate.month &&
            taskList.date.day == selectedDate.day)
        .toList();

    notifyListeners();
  }

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    gitTask();
  }
}
