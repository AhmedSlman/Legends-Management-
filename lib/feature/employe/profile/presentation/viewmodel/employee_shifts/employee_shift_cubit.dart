import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';
import '../../../../../admin/shifts/model/shifts_model.dart';

part 'employee_shift_state.dart';

class EmployeeShiftCubit extends Cubit<EmployeeShiftState> {
  EmployeeShiftCubit() : super(EmployeeShiftInitial());

  Future<void> getEmployeeShifts() async {
    emit(EmployeeShiftLoading());

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.employeeShifts,
        token: myToken,
      );
      if (response.statusCode == 200) {
        ShiftsModel shifts = ShiftsModel.fromJson(response.data);
        emit(EmployeeShiftSuccess(shifts));
      }
    } catch (e) {
      emit(
        EmployeeShiftFailure(
          e.toString(),
        ),
      );
    }
  }
}
