import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/feature/admin/auth/signup/data/admin_register_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../../core/network/remote/dio_helper.dart';

part 'admin_register_state.dart';

class AdminRegisterCubit extends Cubit<AdminRegisterState> {
  AdminRegisterCubit() : super(AdminRegisterInitial());

  AdminRegisterModel? adminRegisterModel;

  Future<void> adminRegister({
    required String name,
    required String email,
    required String passWord,
    required String phone,
    required String passwordconfirmation,
    required String bankaccount,
  }) async {
    emit(AdminRegisterLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.adminRegister,
        data: {
          'email': email,
          'password': passWord,
          'name': name,
          'bank_account': bankaccount,
          'phone': phone,
          'password_confirmation': passwordconfirmation,
        },
      );
      if (response.statusCode == 201) {
        adminRegisterModel = AdminRegisterModel.fromJson(response.data);
        emit(AdminRegisterSuccess(adminRegisterModel!));
      }
    } catch (e) {
      emit(
        AdminRegisterFailure(
          e.toString(),
        ),
      );
    }
  }
}
