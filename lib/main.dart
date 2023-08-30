import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/presentation/blocs/bloc/task_bloc.dart';
import 'package:project/core/routes/Route.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        routes: Routes.getRoute(),
      ),
    );
  }
}
