part of 'admin_register_cubit.dart';

@immutable
sealed class AdminRegisterState {}

final class AdminRegisterInitial extends AdminRegisterState {}

final class AdminRegisterLoading extends AdminRegisterState {}

final class AdminRegisterSuccess extends AdminRegisterState {
  final AdminRegisterModel adminRegisterModel;

  AdminRegisterSuccess(this.adminRegisterModel);
  
}
final class AdminRegisterFailure extends AdminRegisterState {
  final String errMsg;

  AdminRegisterFailure(this.errMsg);
  
}


