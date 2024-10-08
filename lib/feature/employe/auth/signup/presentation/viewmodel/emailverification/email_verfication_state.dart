part of 'email_verfication_cubit.dart';

@immutable
sealed class EmailVerficationState {}

final class EmailVerficationInitial extends EmailVerficationState {}

final class EmailVerificationLoading extends EmailVerficationState {}

final class EmailVerificationSuccess extends EmailVerficationState {}

final class EmailVerificationFailure extends EmailVerficationState {
  final String errMsg;

  EmailVerificationFailure({required this.errMsg});
}
