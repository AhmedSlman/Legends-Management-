part of 'employee_home_tasks_cubit.dart';

@immutable
sealed class EmployeeHomeTasksState {}

final class EmployeeHomeTasksInitial extends EmployeeHomeTasksState {}

final class EmployeeHomeTasksLoading extends EmployeeHomeTasksState {}

final class EmployeeHomeTasksSuccess extends EmployeeHomeTasksState {
  final EmployeeTasksModel? employeeTasks;

  EmployeeHomeTasksSuccess(this.employeeTasks);
}

final class EmployeeHomeTasksFailure extends EmployeeHomeTasksState {
  final String errMsg;

  EmployeeHomeTasksFailure(this.errMsg);

}
