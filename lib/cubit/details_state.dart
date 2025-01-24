part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();
}

final class DetailsInitial extends DetailsState {
  @override
  List<Object> get props => [];
}

final class DetailsMovieLoaded extends DetailsState {
  final DetailsMovie detailsMovie;

  const DetailsMovieLoaded(this.detailsMovie);

  @override
  List<Object?> get props => [detailsMovie];
}

final class DetailsMovieLoadingFailed extends DetailsState {
  final String message;

  const DetailsMovieLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
