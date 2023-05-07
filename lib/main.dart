import 'package:flutter/material.dart';
import 'package:namer_app/view_models/app_view_model.dart';
import 'package:namer_app/views/task_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}
