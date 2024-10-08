import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/feature/admin/shifts/model/shifts_model.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';

part 'shifts_state.dart';

class ShiftsCubit extends Cubit<ShiftsState> {
  ShiftsCubit() : super(ShiftsInitial());

  Future<void> getShifts() async {
    emit(ShiftsLoading());

    List<ShiftsData> shifts = [];

    try {
      Response response = await DioHelper.getData(
        endPoint: ApiConstance.shifts,
        token: myToken,
      );

      if (response.statusCode == 200) {
        for (var i in response.data['data']) {
          shifts.add(ShiftsData.fromJson(i));
        }
        emit(
          ShiftsSuccess(shifts),
        );
      }
    } catch (e) {
      emit(
        ShiftsFailure(e.toString()),
      );
    }
  }
}
