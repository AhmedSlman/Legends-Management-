import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../../home/data/models/tasks_model.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit() : super(CreateTaskInitial());

  TasksModel? tasksModel;

  Future<void> createTask(
      {required String name,
      required String id,
      required String description}) async {
    emit(CreateTaskLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.createTask,
        token: myToken,
        data: {
          'name': name,
          'employee_id': id,
          'description': description,
        },
      );
      if (response.statusCode == 201) {
        tasksModel = TasksModel.fromJson(response.data['data']);
        emit(CreateTaskSuccess(tasksModel!));
      }
    } catch (e) {
      emit(
        CreateTaskFailure(
          e.toString(),
        ),
      );
    }
  }
}
