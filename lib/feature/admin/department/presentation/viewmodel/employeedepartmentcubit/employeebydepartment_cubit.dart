import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/remote/api_constant.dart';
import '../../../data/department_model.dart';

part 'employeebydepartment_state.dart';

class EmployeebydepartmentCubit extends Cubit<EmployeebydepartmentState> {
  EmployeebydepartmentCubit() : super(EmployeebydepartmentInitial());

  Future<void> getEmployeesByDepartments({required String department}) async {
    emit(EmployeebydepartmentLoading());

    try {
      DepartmentModel? departmentModel;
      Response response = await DioHelper.postData(
        token: myToken,
        endPoint: ApiConstance.getEmployeesByDepartment,
        data: {
          'department': department,
        },
      );

      if (response.statusCode == 200) {
        departmentModel = DepartmentModel.fromJson(response.data);
        emit(EmployeebydepartmentSuccess(departmentModel));
      }
    } catch (e) {
      emit(
        EmployeebydepartmentFailure(
          e.toString(),
        ),
      );
    }
  }
}
