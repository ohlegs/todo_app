part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class GetTaskEvent extends TaskEvent {
  final List<Task> allTasks;
  GetTaskEvent({required this.allTasks});
}

class InitTaskEvent extends TaskEvent {
  InitTaskEvent();
}

class AddNewTask extends TaskEvent {
  Task newTask;
  AddNewTask({required this.newTask});
}
