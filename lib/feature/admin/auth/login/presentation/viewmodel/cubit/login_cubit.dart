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

  Future<void> userLogin(
      {required String email, required String passWord}) async {
    emit(LoginLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.login,
        data: {'email': email, 'password': passWord},
      );
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        emit(LoginSuccess(loginModel!));
      }
    } catch (e, s) {
      print('error occured $e');
      print(ApiConstance.login);
      emit(
        LoginFailure(
          errMsg: e.toString(),
        ),
      );
    }
  }
}
