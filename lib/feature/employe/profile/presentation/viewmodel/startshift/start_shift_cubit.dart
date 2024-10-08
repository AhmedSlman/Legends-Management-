import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'start_shift_state.dart';

class StartShiftCubit extends Cubit<StartShiftState> {
  StartShiftCubit() : super(StartShiftInitial());

  Future<void> startShift({required String shiftId}) async {
    final int id = int.parse(shiftId);

    // Update loading state for the specific shift
    final currentStates = Map<int, bool>.from(state.loadingStates);
    currentStates[id] = true; // Set loading for this shift

    emit(StartShiftLoading(currentStates)); // Emit loading state for the shift

    try {
      Response response = await DioHelper.postData(
        endPoint: '${ApiConstance.createShift}/$shiftId/start',
        data: {},
        token: myToken,
      );

      if (response.statusCode == 200) {
        // Mark this shift as not loading and capture the success message
        currentStates[id] = false;
        final message = response.data['message']; // Capture the success message
        emit(StartShiftSuccess(
            currentStates, message)); // Emit success state with message
      }
    } catch (e) {
      currentStates[id] = false; // Always mark loading as false
      String errorMessage;

      if (e is DioException) {
        if (e.response?.statusCode == 404 &&
            e.response?.data['error'] ==
                "Visit not found or it has already been started.") {
          errorMessage =
              'Shift has already been started'; // Change this message
        } else {
          errorMessage = 'Network error: ${e.message}';
        }
        emit(StartShiftFailure(currentStates,
            errorMessage)); // Emit failure state with specific error message
      } else {
        emit(StartShiftFailure(currentStates,
            'Unexpected error: ${e.toString()}')); // Handle other exceptions
      }
    }
  }
}
