part of 'employees_cubit.dart';

@immutable
sealed class EmployeesState {}

final class EmployeesInitial extends EmployeesState {}

final class EmployeesCountLoading extends EmployeesState {}

final class EmployeesCountsuccess extends EmployeesState {
  final int count;

  EmployeesCountsuccess(this.count);
}

final class EmployeesCountFailure extends EmployeesState {
  final String errMsg;

  EmployeesCountFailure(this.errMsg);
}
