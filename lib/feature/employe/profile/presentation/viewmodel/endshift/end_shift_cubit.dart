import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

import 'end_shift_state.dart';

class EndShiftCubit extends Cubit<EndShiftState> {
  EndShiftCubit() : super(EndShiftInitial());

  Future<void> endShift({required String shiftId}) async {
    final int id = int.parse(shiftId);

    // Update loading state for the specific shift
    final currentStates = Map<int, bool>.from(state.loadingStates);
    currentStates[id] = true; // Set loading for this shift

    emit(EndShiftLoading(currentStates)); // Emit loading state for the shift

    try {
      Response response = await DioHelper.postData(
        endPoint: '${ApiConstance.createShift}/$shiftId/end',
        data: {},
        token: myToken,
      );

      if (response.statusCode == 200) {
        // Mark this shift as not loading and capture the success message
        currentStates[id] = false;
        final message = response.data['message']; // Capture the success message
        emit(EndShiftSuccess(
            currentStates, message)); // Emit success state with message
      }
    } catch (e) {
      currentStates[id] = false; // Always mark loading as false
      String errorMessage;

      if (e is DioException) {
        if (e.response?.statusCode == 404 &&
            e.response?.data['error'] ==
                "Visit not found or it has already been ended.") {
          errorMessage = 'Shift has already been ended'; // Change this message
        } else {
          errorMessage = 'Network error: ${e.message}';
        }
        emit(EndShiftFailure(currentStates,
            errorMessage)); // Emit failure state with specific error message
      } else {
        emit(EndShiftFailure(currentStates,
            'Unexpected error: ${e.toString()}')); // Handle other exceptions
      }
    }
  }
}
