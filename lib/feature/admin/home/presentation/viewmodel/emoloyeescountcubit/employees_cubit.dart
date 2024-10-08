import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit() : super(EmployeesInitial());

  Future<void> fetchEmployeeCount() async {
    emit(EmployeesCountLoading());

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.getEmployeesCount,
        token: myToken,
      );

      if (response.statusCode == 200) {
      
        String responseData = response.data.toString();

        int employeeCount = int.parse(
          responseData.split(' ')[0],
        );

      
        emit(EmployeesCountsuccess(employeeCount));
      }
    } catch (e) {
      emit(EmployeesCountFailure(e.toString()));
    }
  }
}
