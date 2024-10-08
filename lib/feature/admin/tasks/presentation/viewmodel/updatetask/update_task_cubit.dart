import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:legends_management/feature/admin/home/data/models/tasks_model.dart';
import 'package:meta/meta.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitial());

  Future<void> updateStatus(
      {required String status, required String id}) async {
    emit(UpdateTaskLoading());

    try {
      Response response = await DioHelper.puttData(
        endPoint: '${ApiConstance.updateTask}/$id',
        data: {'status': status},
        token: myToken,
      );
      if (response.statusCode == 200) {
        TasksData tasksModel = TasksData.fromJson(response.data);
        emit(UpdateTaskSuccess(tasksModel));
      }
    } catch (e) {
      emit(
        UpdateTaskFailure(
          e.toString(),
        ),
      );
    }
  }
}
