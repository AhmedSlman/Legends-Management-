part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksSuccess extends TasksState {
  final List<TasksData> tasksModel;

  TasksSuccess(this.tasksModel);
}

final class TasksFailure extends TasksState {
  final String errMsg;

  TasksFailure(this.errMsg);
}
