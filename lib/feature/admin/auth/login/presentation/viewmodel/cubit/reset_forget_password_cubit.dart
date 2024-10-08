import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../../core/network/remote/dio_helper.dart';

part 'reset_forget_password_state.dart';

class ResetForgetPasswordCubit extends Cubit<ResetForgetPasswordState> {
  ResetForgetPasswordCubit() : super(ResetForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ResetForgetPasswordLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.forgetPassword,
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        // Handle success response
        emit(ResetForgetPasswordSuccess(
            message: 'Check your email for the code.'));
      } else {
        emit(ResetForgetPasswordFailure(errMsg: 'Failed to send reset code.'));
      }
    } catch (e) {
      emit(ResetForgetPasswordFailure(errMsg: e.toString()));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetForgetPasswordLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.resetPassword,
        data: {
          'email': email,
          'code': code,
          'password': newPassword,
          'password_confirmation': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        // Handle success response
        emit(ResetForgetPasswordSuccess(
            message: 'Password has been reset successfully.'));
      } else {
        emit(ResetForgetPasswordFailure(errMsg: 'Failed to reset password.'));
      }
    } catch (e) {
      emit(ResetForgetPasswordFailure(errMsg: e.toString()));
    }
  }
}
