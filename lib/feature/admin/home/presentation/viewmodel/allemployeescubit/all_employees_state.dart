part of 'all_employees_cubit.dart';

@immutable
sealed class AllEmployeesState {}

final class AllEmployeesInitial extends AllEmployeesState {}

final class AllEmployeesLoading extends AllEmployeesState {}

final class AllEmployeesSuccess extends AllEmployeesState {
  final List<AllEmplyeesModel> allEmployees;

  AllEmployeesSuccess(this.allEmployees);
}

final class AllEmployeesFailure extends AllEmployeesState {
  final String errMsg;

  AllEmployeesFailure(this.errMsg);
}
