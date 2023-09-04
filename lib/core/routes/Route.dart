import 'package:flutter/material.dart';
import 'package:project/core/presentation/pages/CreateTask.dart';
import 'package:project/core/presentation/pages/FullViewTask.dart';
import 'package:project/core/presentation/pages/Home.dart';

class Routes {
  static const String home = '/';
  static const String createTask = '/createTask';
  static const String details = '/details';

  static Map<String, WidgetBuilder> getRoute({task}) {
    return {
      home: (context) => const Home(),
      createTask: (context) => const CreateTask(),
      details: (context) =>  FullViewTask(task: task)
    };
  }
}
