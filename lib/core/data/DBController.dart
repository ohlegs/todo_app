import 'package:hive_flutter/adapters.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/domain/DBControler_abstr.dart';
export 'DBController.dart';

DBControllerImplements dbControllerImplements = DBControllerImplements();

class DBControllerImplements implements DBController_abstr {
  @override
  Future<void> close() async {
    final box = await Hive.openBox<Task>('tasks');
    await box.close();
  }

  @override
  Future<void> create(Task data) async {
    final box = await Hive.openBox<Task>('tasks');
    await box.add(data);
    await box.close();
  }

  @override
  Future<Task?> read(int key) async {
    final box = await Hive.openBox<Task>('tasks');
    final value = box.get(key);
    await box.close();
    return value;
  }

  @override
  Future<List<Task>> getAll() async {
    final Box<Task> box = await Hive.openBox<Task>('tasks');
    final value = box.values.toList();
    await box.close();
    return value;
  }

  @override
  Future<void> update(int key, Task newData) async {
    final box = await Hive.openBox<Task>('tasks');
    await box.put(key, newData);
    await box.close();
  }

  @override
  Future<void> delete(int key) async {
    final box = await Hive.openBox<Task>('tasks');
    await box.delete(key);
    await box.close();
  }
}
