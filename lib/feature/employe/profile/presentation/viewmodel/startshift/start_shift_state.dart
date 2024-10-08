part of 'start_shift_cubit.dart';

@immutable
sealed class StartShiftState {
  final Map<int, bool> loadingStates;

  StartShiftState({this.loadingStates = const {}}); // Add a loadingStates map
}

final class StartShiftInitial extends StartShiftState {}

final class StartShiftLoading extends StartShiftState {
  StartShiftLoading(Map<int, bool> loadingStates)
      : super(loadingStates: loadingStates);
}

final class StartShiftSuccess extends StartShiftState {
  final String message;

  StartShiftSuccess(Map<int, bool> loadingStates, this.message)
      : super(loadingStates: loadingStates);
}

final class StartShiftFailure extends StartShiftState {
  final String errMsg;

  StartShiftFailure(
    Map<int, bool> loadingStates, // Pass the loading states map
    this.errMsg,
  ) : super(loadingStates: loadingStates);
}


