part of 'admin_employee_data_cubit.dart';

@immutable
sealed class AdminEmployeeDataState {}

final class AdminEmployeeDataInitial extends AdminEmployeeDataState {}

final class AdminEmployeeDataLoading extends AdminEmployeeDataState {}

final class AdminEmployeeDataSuccess extends AdminEmployeeDataState {
  final List<Profile> employeeProfile;

  AdminEmployeeDataSuccess(this.employeeProfile);
}

final class AdminEmployeeDataFailure extends AdminEmployeeDataState {
  final String errMsg;

  AdminEmployeeDataFailure(this.errMsg);
}
