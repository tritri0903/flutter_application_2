import 'package:flutter/material.dart';
import 'package:namer_app/models/task_model.dart';
import 'package:namer_app/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Jon Snow");

  Color clrLv1 = Colors.grey.shade50;
  Color clrLv2 = Colors.grey.shade200;
  Color clrLv3 = Colors.grey.shade800;
  Color clrLv4 = Colors.grey.shade900;

  TextStyle taskStyle = TextStyle(
      color: Colors.grey.shade800, fontSize: 17, fontWeight: FontWeight.w500);

  int get numTask => tasks.length;

  int get numTaskRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  int repNum = 10;
  int serNum = 3;

  void setRepValue(bool i) {
    if (i) {
      repNum++;
    } else {
      repNum--;
    }
    if (repNum <= 0) {
      repNum = 1;
    }
    if (repNum >= 100) {
      repNum = 100;
    }
    notifyListeners();
  }

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  int getTaskRep(int taskIndex) {
    return tasks[taskIndex].rep;
  }

  int getTaskSer(int taskIndex) {
    return tasks[taskIndex].ser;
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompetedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: (context),
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
