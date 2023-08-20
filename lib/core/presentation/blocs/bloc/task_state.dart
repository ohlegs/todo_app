part of 'task_bloc.dart';

@immutable
sealed class TaskState {
  List<Task> allTask;
  TaskState({required this.allTask});
}

class TaskInitial extends TaskState {
  final List<Task> allTaskInitial;

  TaskInitial({required this.allTaskInitial}) : super(allTask: allTaskInitial);
}

class TaskLoaded extends TaskState {
  final List<Task> taskList;
  TaskLoaded({required this.taskList}) : super(allTask: taskList);
}
