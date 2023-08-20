import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/presentation/blocs/bloc/task_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Scaffold(
        // backgroundColor: black,
        floatingActionButton: IconButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber)),
          icon: const Icon(Icons.add),
          onPressed: () => onPressFloatingActionButton(state.allTask),
        ),
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: ListView.builder(
          itemCount: state.allTask.length,
          itemBuilder: (context, index) => Text(state.allTask[index].title),
        ),
      );
    });
  }

  void onPressFloatingActionButton(List<Task> allTask) {}

  @override
  void initState() async {
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(GetTaskEvent(allTasks: await dbController.getAll()));
    super.initState();
  }
}
