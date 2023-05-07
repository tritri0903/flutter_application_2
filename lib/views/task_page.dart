import 'package:flutter/material.dart';
import 'package:namer_app/views/add_task_view.dart';
import 'package:namer_app/views/header_view.dart';
import 'package:namer_app/views/task_info_view.dart';
import 'package:namer_app/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          //Header View
          Expanded(
            flex: 1,
            child: HeaderView(),
          ),
          //Task Info View
          Expanded(
            flex: 1,
            child: TaskInfoView(),
          ),
          //Task List View
          Expanded(
            flex: 6,
            child: TaskListView(),
          ),
        ]),
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
