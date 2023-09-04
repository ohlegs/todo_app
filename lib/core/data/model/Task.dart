import 'package:hive_flutter/adapters.dart';

part 'Task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime dateStart;
  @HiveField(4)
  DateTime dateEnd;
  @HiveField(5)
  String? statusCompleet;
  @HiveField(6)
  bool? compleet;
  @HiveField(7)
  num? price;
  @HiveField(8)
  int? priority;

  Task(
      {required this.title,
      required this.description,
      required this.dateStart,
      required this.dateEnd,
      required this.statusCompleet,
      required this.compleet,
      required this.price,
      required this.priority});
}
