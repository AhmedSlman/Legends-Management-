part of 'employee_shift_cubit.dart';

@immutable
sealed class EmployeeShiftState {}

final class EmployeeShiftInitial extends EmployeeShiftState {}

final class EmployeeShiftLoading extends EmployeeShiftState {}

final class EmployeeShiftSuccess extends EmployeeShiftState {
  final ShiftsModel shiftsModel;

  EmployeeShiftSuccess(this.shiftsModel);
}

final class EmployeeShiftFailure extends EmployeeShiftState {
  final String errMsg;

  EmployeeShiftFailure(this.errMsg);
}
