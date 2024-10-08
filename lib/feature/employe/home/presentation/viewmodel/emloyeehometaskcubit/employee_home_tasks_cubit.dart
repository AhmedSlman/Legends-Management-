import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../model/employee_tasks_model.dart';

part 'employee_home_tasks_state.dart';

class EmployeeHomeTasksCubit extends Cubit<EmployeeHomeTasksState> {
  EmployeeHomeTasksCubit() : super(EmployeeHomeTasksInitial());

  Future<void> fetchAllEmployeesTasks() async {
    emit(EmployeeHomeTasksLoading());


    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.getAllTasks,
        token: myToken,
      );
      if (response.statusCode == 200) {
        EmployeeTasksModel employeeTasks =
            EmployeeTasksModel.fromJson(response.data);

        emit(
          EmployeeHomeTasksSuccess(employeeTasks),
        );
      }
    } catch (e) {
      emit(
        EmployeeHomeTasksFailure(e.toString()),
      );
    }
  }
}
