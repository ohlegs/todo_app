import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/presentation/blocs/bloc/task_bloc.dart';
import 'package:project/core/presentation/widgets/CustomDataPicker.dart';
import 'package:project/core/presentation/widgets/CustomElevatedButton.dart';
import 'package:project/core/presentation/widgets/CustomTextField.dart';

enum Priority { low, normal, hot }

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Color(0xFFfee4c1)),
              onPressed: () {
                _iconButton();
              },
            ),
            title: const Text("Create a new task",
                style: TextStyle(color: Color(0xFFfee4c1))),
          ),
          SliverToBoxAdapter(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextField(
                    controller: taskTitle,
                    margin: const EdgeInsets.only(top: 10),
                    label: "Task name",
                  ),
                  CustomTextField(
                    controller: taskDescription,
                    margin: const EdgeInsets.only(top: 20),
                    label: "Task description",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDataPicker(
                          label: "Start Date",
                          margin: const EdgeInsets.only(top: 20)),
                      CustomDataPicker(
                          label: "End Date",
                          margin: const EdgeInsets.only(left: 20, top: 20)),
                    ],
                  ),
                  CustomTextField(
                    controller: description,
                    margin: const EdgeInsets.only(top: 20),
                    label: "Description",
                    height: 10,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    callback: () {
                      _customElevatedButton();
                    },
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    label: "Create  task",
                    width: MediaQuery.of(context).size.width,
                  )
                ]),
          )
        ],
      ),
    );
  }

  _customElevatedButton() {
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(AddNewTask(
        newTask: Task(
            title: taskTitle.text,
            description: taskDescription.text,
            dateStart: DateTime.now(),
            dateEnd: DateTime.now(),
            statusCompleet: "NULL",
            compleet: false,
            price: 150)));
  }

  _iconButton() {
    Navigator.pop(context);
  }
}
