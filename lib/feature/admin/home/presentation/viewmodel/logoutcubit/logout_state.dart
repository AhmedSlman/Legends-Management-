part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final LogoutModel logoutModel;

  LogoutSuccess(this.logoutModel);
}

final class LogoutFailure extends LogoutState {
  final String errMsg;

  LogoutFailure(this.errMsg);
}
