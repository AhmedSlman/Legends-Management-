part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoading extends RatingState {}

final class RatingSuccess extends RatingState {
  final RatingModel ratingModel;

  RatingSuccess(this.ratingModel);
}

final class RatingFailure extends RatingState {
  final String errMsg;

  RatingFailure(this.errMsg);
}
