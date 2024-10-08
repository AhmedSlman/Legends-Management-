part of 'employee_profile_cubit.dart';

@immutable
sealed class EmployeeProfileState {}

final class EmployeeProfileInitial extends EmployeeProfileState {}

final class EmployeeProfileLoading extends EmployeeProfileState {}

final class EmployeeProfileSuccess extends EmployeeProfileState {
  final List<Profile> employeeProfile;

  EmployeeProfileSuccess(this.employeeProfile);
}

final class EmployeeProfileFailure extends EmployeeProfileState {
  final String errMsg;

  EmployeeProfileFailure(this.errMsg);

}
