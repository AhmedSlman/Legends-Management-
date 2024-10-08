part of 'home_tasks_count_cubit.dart';

@immutable
sealed class HomeTasksCountState {}

final class HomeTasksCountInitial extends HomeTasksCountState {}

final class HomeTasksCountLoading extends HomeTasksCountState {}

final class HomeTasksCountSuccess extends HomeTasksCountState {
  final HomeTasksCount? homeTasksCount;

  HomeTasksCountSuccess(this.homeTasksCount);
}

final class HomeTasksCountFailure extends HomeTasksCountState {
  final String errMsg;

  HomeTasksCountFailure(this.errMsg);
}
