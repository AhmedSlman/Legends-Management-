part of 'shifts_cubit.dart';

class ShiftsState {}

final class ShiftsInitial extends ShiftsState {}

final class ShiftsLoading extends ShiftsState {}

final class ShiftsSuccess extends ShiftsState {
  final List<ShiftsData> shifts;

  ShiftsSuccess(this.shifts);
}

final class ShiftsFailure extends ShiftsState {
  final String errMsg;

  ShiftsFailure(this.errMsg);
}
