part of 'create_task_cubit.dart';

@immutable
sealed class CreateTaskState {}

final class CreateTaskInitial extends CreateTaskState {}

final class CreateTaskLoading extends CreateTaskState {}

final class CreateTaskSuccess extends CreateTaskState {
  final TasksModel tasksModel;

  CreateTaskSuccess(this.tasksModel);
}

final class CreateTaskFailure extends CreateTaskState {
  final String errMsg;

  CreateTaskFailure(this.errMsg);
}
