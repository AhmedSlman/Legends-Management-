part of 'create_shift_cubit.dart';

@immutable
sealed class CreateShiftState {}

final class CreateShiftInitial extends CreateShiftState {}

final class CreateShiftLoading extends CreateShiftState {}

final class CreateShiftSuccess extends CreateShiftState {
  final ShiftsModel shiftsModel;

  CreateShiftSuccess(this.shiftsModel);
}

final class CreateShiftFailure extends CreateShiftState {
  final String errMsg;

  CreateShiftFailure(this.errMsg);
}
