import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/core/data/model/Task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial(allTaskInitial: [])) {
    on<GetTaskEvent>((event, emit) {
      emit(TaskLoaded(taskList: event.allTasks));
    });
  }
}
