import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../data/models/employee_profile_model.dart';

part 'employee_profile_state.dart';

class EmployeeProfileCubit extends Cubit<EmployeeProfileState> {
  EmployeeProfileCubit() : super(EmployeeProfileInitial());

  Future<void> fetchEmployeeProfileData() async {
    emit(EmployeeProfileLoading());

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.employeeProfile,
        token: myToken,
      );
      if (response.statusCode == 200) {
        final profile = Profile.fromJson(response.data['profile']);
        emit(EmployeeProfileSuccess([profile])); // Wrapping in a list
      }
    } catch (e, s) {
      print('Error: $e, StackTrace: $s');
      emit(
        EmployeeProfileFailure(
          e.toString(),
        ),
      );
    }
  }
}
