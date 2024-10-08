import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/feature/admin/shifts/model/shifts_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/network/remote/api_constant.dart';
import '../../../../../../core/network/remote/dio_helper.dart';

part 'create_shift_state.dart';

class CreateShiftCubit extends Cubit<CreateShiftState> {
  CreateShiftCubit() : super(CreateShiftInitial());

  ShiftsModel? shiftsModel;

  Future<void> createShift({
    required String from,
    required String to,
    required String day,
    required String id,
  }) async {
    emit(CreateShiftLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: ApiConstance.createShift,
        token: myToken,
        data: {
          'from': from,
          'to': to,
          'day': day,
          'employee_id': id,
        },
      );
      if (response.statusCode == 201) {
        shiftsModel = ShiftsModel.fromJson(response.data['data']);
        emit(CreateShiftSuccess(shiftsModel!));
      }
    } catch (e) {
      emit(
        CreateShiftFailure(
          e.toString(),
        ),
      );
    }
  }
}
