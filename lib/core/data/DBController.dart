import 'package:hive_flutter/adapters.dart';
import 'package:project/core/data/model/Task.dart';
import 'package:project/core/domain/DBControler_abstr.dart';
export 'DBController.dart';

DBController dbController = DBController();

class DBController implements DBController_abstr {
  Box<Task>? _box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    _box = await Hive.openBox('tasks');
  }

  @override
  Future<void> close() async {
    await _box?.close();
  }

  @override
  Future<void> create(Task data) async {
    await _box?.add(data);
  }

  @override
  Future<Task?> read(int key) async {
    final value = await _box?.get(key);
    return value;
  }

  @override
  Future<List<Task>> getAll() async {
    final value = _box?.values.toList();
    return value ?? [];
  }

  @override
  Future<void> update(int key, Task newData) async {
    return await _box?.put(key, newData);
  }

  @override
  Future<void> delete(int key) async {
    await _box?.delete(key);
  }
}
