import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/data/model/Task.dart';

import '../blocs/bloc/task_bloc.dart';

class FullViewTask extends StatefulWidget {
  final Task? task;

  FullViewTask({super.key, this.task});

  @override
  State<FullViewTask> createState() => _State();
}

class _State extends State<FullViewTask> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Task;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mode_edit_outline_outlined))
            ],
            title: Text(arguments.title),
          ),
        ],
      ),
    );
  }
}
