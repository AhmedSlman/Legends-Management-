import 'package:meta/meta.dart';



@immutable
sealed class EndShiftState {
  final Map<int, bool> loadingStates;

  EndShiftState({this.loadingStates = const {}}); // Add a loadingStates map
}

final class EndShiftInitial extends EndShiftState {}

final class EndShiftLoading extends EndShiftState {
  EndShiftLoading(Map<int, bool> loadingStates)
      : super(loadingStates: loadingStates);
}

final class EndShiftSuccess extends EndShiftState {
  final String message;

  EndShiftSuccess(Map<int, bool> loadingStates, this.message)
      : super(loadingStates: loadingStates);
}

final class EndShiftFailure extends EndShiftState {
  final String errMsg;

  EndShiftFailure(Map<int, bool> loadingStates, this.errMsg)
      : super(loadingStates: loadingStates);
}
