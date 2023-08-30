import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/presentation/Colors.dart';
import 'package:project/core/presentation/blocs/bloc/task_bloc.dart';
import 'package:project/core/presentation/widgets/CustomTextField.dart';
import 'package:project/core/presentation/widgets/ListViewItem.dart';
import 'package:project/core/routes/Route.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollViewColtroller = ScrollController();
  bool floatingActionButtonContent = false;

  void dispose() {
    scrollViewColtroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(listener: (context, state) {
      print(state.allTask.length);
    }, child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.black,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _onPressFloatingActionButton();
          },
        ),
        body: NotificationListener(
            onNotification: (ScrollNotification sctollInfo) {
              _swithOnPressFloatingActionButtonContent(sctollInfo);
              return true;
            },
            child: CustomScrollView(controller: scrollViewColtroller, slivers: [
              SliverAppBar(
                backgroundColor: AppColors.black,
                centerTitle: true,
                floating: true,
                snap: true,
                pinned: true,
                actions: [
                  Transform.rotate(
                    angle: 90 * pi / 180,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          color: AppColors.white,
                          Icons.tune_rounded,
                        )),
                  )
                ],
                title: const Text(
                    style: TextStyle(color: AppColors.white), "Home"),
              ),
              SliverList.builder(
                itemCount: state.allTask.length,
                itemBuilder: (context, index) =>
                    ListViewItem(task: state.allTask[index]),
              )
            ])),
      );
    }));
  }

  void _onPressFloatingActionButton() {
    Navigator.pushNamed(context, Routes.createTask);
  }

  @override
  void initState() {
    super.initState();
    scrollViewColtroller = ScrollController();
    final bloc = BlocProvider.of<TaskBloc>(context);
    bloc.add(InitTaskEvent());
  }

  _swithOnPressFloatingActionButtonContent(ScrollNotification scrollDirection) {
    if (scrollViewColtroller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (floatingActionButtonContent != true) {
        setState(() {
          floatingActionButtonContent = true;
        });
      }
    } else if (scrollViewColtroller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (floatingActionButtonContent != false) {
        setState(() {
          floatingActionButtonContent = false;
        });
      }
    }
  }
}
