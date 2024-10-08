import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../../core/network/remote/dio_helper.dart';
import '../../../data/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel? loginModel;

  Future<void> userLogin({
    required String email,
    required String passWord,
  }) async {
    emit(LoginLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.login,
        data: {'email': email, 'password': passWord},
      );

      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        emit(LoginSuccess(loginModel!));
      } else {
        // If the status code is not 200 but we received a response, handle it
        emit(LoginFailure(
          errMsg: response.data['message'] ?? 'Login failed. Please try again.',
        ));
      }
    } on DioException catch (dioError) {
      // Handle DioError specifically
      if (dioError.response != null) {
        emit(LoginFailure(
          errMsg: dioError.response?.data['message'] ??
              'Login failed. Please try again.',
        ));
      } else {
        emit(LoginFailure(
          errMsg: dioError.message ?? 'Login failed',
        ));
      }
    } catch (e) {
      // Catch any other exceptions that are not DioErrors
      emit(LoginFailure(
        errMsg: e.toString(),
      ));
    }
  }
}
