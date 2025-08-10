part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}
final class DetailsSuccess extends DetailsState {
  final ProductEntity productEntity;

  DetailsSuccess(this.productEntity);
}
final class DetailsError extends DetailsState {
  final String errMessage;

  DetailsError(this.errMessage);
}
