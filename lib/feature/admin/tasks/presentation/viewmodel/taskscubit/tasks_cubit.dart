import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:legends_management/feature/admin/home/data/models/tasks_model.dart';
import 'package:meta/meta.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  Future<void> getAllTasks() async {
    emit(TasksLoading());

    List<TasksData> tasksData = [];

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.getAllTasks,
        token: myToken,
      );
      if (response.statusCode == 200) {
        for (var i in response.data['data']) {
          tasksData.add(TasksData.fromJson(i));
        }
        emit(TasksSuccess(tasksData));
      }
    } catch (e) {
      emit(
        TasksFailure(
          e.toString(),
        ),
      );
    }
  }
}
