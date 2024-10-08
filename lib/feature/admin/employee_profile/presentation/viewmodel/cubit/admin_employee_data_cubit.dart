import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../../../employe/profile/data/models/employee_profile_model.dart';

part 'admin_employee_data_state.dart';

class AdminEmployeeDataCubit extends Cubit<AdminEmployeeDataState> {
  AdminEmployeeDataCubit() : super(AdminEmployeeDataInitial());

  Future<void> fetchEmployeeProfileData(String employeeId) async {
    emit(AdminEmployeeDataLoading());

    try {
      Response response = await DioHelper.getData(
        endPoint: '${ApiConstance.getEmployeeDetails}/$employeeId',
        token: myToken,
      );
      if (response.statusCode == 200) {
        final profile = Profile.fromJson(response.data['profile']);
        emit(AdminEmployeeDataSuccess([profile])); // Wrapping in a list
      }
    } catch (e) {
      emit(
        AdminEmployeeDataFailure(
          e.toString(),
        ),
      );
    }
  }
}
