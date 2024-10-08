part of 'employeebydepartment_cubit.dart';

@immutable
sealed class EmployeebydepartmentState {}

final class EmployeebydepartmentInitial extends EmployeebydepartmentState {}

final class EmployeebydepartmentLoading extends EmployeebydepartmentState {}

final class EmployeebydepartmentSuccess extends EmployeebydepartmentState {
  final DepartmentModel departmentModel;

  EmployeebydepartmentSuccess(this.departmentModel);
}

final class EmployeebydepartmentFailure extends EmployeebydepartmentState {
  final String errMsg;

  EmployeebydepartmentFailure(this.errMsg);
}
