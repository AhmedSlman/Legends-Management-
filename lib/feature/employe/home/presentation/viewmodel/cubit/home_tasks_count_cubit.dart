import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../model/home_tasks_count.dart';

part 'home_tasks_count_state.dart';

class HomeTasksCountCubit extends Cubit<HomeTasksCountState> {
  HomeTasksCountCubit() : super(HomeTasksCountInitial());

  Future<void> retriveTasksCount() async {
    emit(HomeTasksCountLoading());


    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.getTasksCount,
        token: myToken,
      );
      if (response.statusCode == 200) {
        HomeTasksCount homeTasksCount = HomeTasksCount.fromJson(response.data);
        emit(
          HomeTasksCountSuccess(homeTasksCount),
        );
      }
    } catch (e) {
      emit(
        HomeTasksCountFailure(
          e.toString(),
        ),
      );
    }
  }
}
