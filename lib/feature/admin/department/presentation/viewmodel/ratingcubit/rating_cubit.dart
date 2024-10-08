import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:legends_management/core/constants/constants.dart';
import 'package:legends_management/core/network/remote/api_constant.dart';
import 'package:legends_management/core/network/remote/dio_helper.dart';
import 'package:legends_management/feature/admin/department/data/rating_model.dart';
import 'package:meta/meta.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  Future<void> addReating({required String rating, required String id}) async {
    emit(RatingLoading());

    try {
      Response response = await DioHelper.postData(
        endPoint: '${ApiConstance.rating}/$id',
        data: {'rating': rating},
        token: myToken,
      );

      if (response.statusCode == 201) {
        RatingModel ratingModel = RatingModel.fromJson(response.data);
        emit(RatingSuccess(ratingModel));
      }
    } catch (e) {
      emit(
        RatingFailure(
          e.toString(),
        ),
      );
    }
  }
}
