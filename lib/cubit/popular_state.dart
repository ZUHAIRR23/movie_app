part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();
}

final class PopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}

final class PopularMovieLoaded extends PopularState {
  final List<PopularMovie> popularMovie;

  const PopularMovieLoaded(this.popularMovie);

  @override
  List<Object?> get props => [popularMovie];
}

final class PopularMovieLoadingFailed extends PopularState {
  final String message;

  const PopularMovieLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}