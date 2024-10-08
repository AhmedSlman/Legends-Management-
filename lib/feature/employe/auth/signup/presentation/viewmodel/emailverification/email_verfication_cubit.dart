import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../../core/network/remote/dio_helper.dart';

part 'email_verfication_state.dart';

class EmailVerficationCubit extends Cubit<EmailVerficationState> {
  EmailVerficationCubit() : super(EmailVerficationInitial());

  Future<void> verifyEmail({
    required String email,
    required String verificationCode,
  }) async {
    emit(EmailVerificationLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.emailVerification,
        data: {
          'email': email,
          'verification_code': verificationCode,
        },
      );

      if (response.statusCode == 200) {
        emit(EmailVerificationSuccess());
      }
    } catch (e) {
      emit(EmailVerificationFailure(errMsg: e.toString()));
    }
  }
}
