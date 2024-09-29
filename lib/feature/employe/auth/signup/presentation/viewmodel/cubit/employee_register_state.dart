part of 'employee_register_cubit.dart';

@immutable
sealed class EmployeeRegisterState {}

final class EmployeeRegisterInitial extends EmployeeRegisterState {}

final class EmployeeRegisterLoading extends EmployeeRegisterState {}

final class EmployeeRegisterSuccess extends EmployeeRegisterState {
  final EmployeeRegisterModel employeeRegisterModel;

  EmployeeRegisterSuccess(this.employeeRegisterModel);
}

final class EmployeeRegisterFailure extends EmployeeRegisterState {
  final String errMsg;

  EmployeeRegisterFailure({required this.errMsg});
}
