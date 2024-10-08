import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/feature/employe/auth/signup/data/employee_register_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../../core/network/remote/dio_helper.dart';

part 'employee_register_state.dart';

class EmployeeRegisterCubit extends Cubit<EmployeeRegisterState> {
  EmployeeRegisterCubit() : super(EmployeeRegisterInitial());

  EmployeeRegisterModel? employeeRegisterModel;

  Future<void> employeeRegister({
    required String name,
    required String email,
    required String passWord,
    required String phone,
    required String passwordconfirmation,
    required String managercode,
    required String department,
    required String level,
    required String bankaccount,
    required String image,
  }) async {
    emit(EmployeeRegisterLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.employeRegister,
        data: {
          'email': email,
          'password': passWord,
          'name': name,
          'bank_account': bankaccount,
          'phone': phone,
          'password_confirmation': passwordconfirmation,
          'manager_code': managercode,
          'department': department,
          'level': level,
          'image': image,
        },
      );

      if (response.statusCode == 201) {
        employeeRegisterModel = EmployeeRegisterModel.fromJson(response.data);
        emit(EmployeeRegisterSuccess(employeeRegisterModel!));
      } else {
        // Handle unsuccessful responses with specific error messages
        emit(EmployeeRegisterFailure(
          errMsg: response.data['message'] ??
              'Registration failed. Please try again.',
        ));
      }
    } on DioException catch (dioError) {
      // Handle DioError specifically
      if (dioError.response != null) {
        emit(EmployeeRegisterFailure(
          errMsg: dioError.response?.data['message'] ??
              'Registration failed. Please try again.',
        ));
      } else {
        emit(EmployeeRegisterFailure(
          errMsg: dioError.message ?? 'signup failed please try again later',
        ));
      }
    } catch (e) {
      // Catch any other exceptions that are not DioErrors
      emit(EmployeeRegisterFailure(
        errMsg: e.toString(),
      ));
    }
  }
}
