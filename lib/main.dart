import 'package:flutter/material.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/routes/Route.dart';

void main() async {
  dbController.init();
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
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: Routes.getRoute(),
    );
  }
}
