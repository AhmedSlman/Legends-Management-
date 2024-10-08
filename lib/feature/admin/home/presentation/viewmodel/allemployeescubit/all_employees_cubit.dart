import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../data/models/all_employees_model.dart';

part 'all_employees_state.dart';

class AllEmployeesCubit extends Cubit<AllEmployeesState> {
  AllEmployeesCubit() : super(AllEmployeesInitial());

  Future<void> fetchAllEmployees() async {
    emit(AllEmployeesLoading());

    final List<AllEmplyeesModel> allEmployees = [];

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.getAllEmployees,
        token: myToken,
      );
      if (response.statusCode == 200) {
        for (var i in response.data) {
          allEmployees.add(AllEmplyeesModel.fromJson(i));
        }
        emit(
          AllEmployeesSuccess(allEmployees),
        );
      }
    } catch (e) {}
  }
}
