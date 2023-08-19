import 'package:flutter/material.dart';
import 'package:project/core/constants/Colors.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/data/model/Task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      floatingActionButton: IconButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.amber)),
        icon: const Icon(Icons.add),
        onPressed: onPressFloatingActionButton,
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) => Text(index.toString()),
      ),
    );
  }

  void onPressFloatingActionButton() {
    // dbController.create(Task(
    //     title: "LOl",
    //     description: "Kek",
    //     dateStart: DateTime.now(),
    //     dateEnd: DateTime.now(),
    //     statusCompleet: "123",
    //     compleet: false,
    //     price: 123));
    dbController.getAll();
  }
}
