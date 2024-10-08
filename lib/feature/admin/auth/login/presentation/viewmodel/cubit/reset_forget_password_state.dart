part of 'reset_forget_password_cubit.dart';

@immutable
sealed class ResetForgetPasswordState {}

final class ResetForgetPasswordInitial extends ResetForgetPasswordState {}

final class ResetForgetPasswordLoading extends ResetForgetPasswordState {}

final class ResetForgetPasswordSuccess extends ResetForgetPasswordState {
  final String message;

  ResetForgetPasswordSuccess({required this.message});
}

final class ResetForgetPasswordFailure extends ResetForgetPasswordState {
  final String errMsg;

  ResetForgetPasswordFailure({required this.errMsg});
}
