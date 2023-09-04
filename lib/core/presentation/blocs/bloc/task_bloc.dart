import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/core/data/DBController.dart';
import 'package:project/core/data/model/Task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial(allTaskInitial: [])) {
    on<GetTaskEvent>((event, emit) {
      emit(TaskLoaded(taskList: event.allTasks));
    });
    on<InitTaskEvent>((event, emit) async {
      try {
        final result = await dbControllerImplements.getAll();
        print("WORK");
        emit(TaskLoaded(taskList: result));
      } catch (e) {
        print(e);
      }
    });
    on<AddNewTask>(
      (event, emit) async {
        dbControllerImplements.create(Task(
            title: event.newTask.title,
            description: event.newTask.description,
            dateStart: DateTime.now(),
            dateEnd: DateTime.now(),
            statusCompleet: "123",
            priority: event.newTask.priority,
            compleet: false,
            price: 123));
        add(InitTaskEvent());
      },
    );
  }
}
