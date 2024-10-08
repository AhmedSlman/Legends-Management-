// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:legends_management/feature/admin/home/data/models/logout_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logOut() async {
    emit(LogoutLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.logout,
        data: {},
        token: myToken,
      );
      if (response.statusCode == 200) {
        LogoutModel logoutModel = LogoutModel.fromJson(response.data);
        emit(
          LogoutSuccess(logoutModel),
        );
      }
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
