import 'package:project/core/data/model/Task.dart';

abstract class DBController_abstr {
  Future<void> init();
  Future<void> close();
  Future<void> create(Task data);
  Future<Task?> read(int key);
  Future<List<Task>> getAll();
  Future<void> update(int key, Task newData);
  Future<void> delete(int key);
}
