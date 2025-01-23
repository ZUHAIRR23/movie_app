part of 'recommendation_cubit.dart';

sealed class RecommendationState extends Equatable {
  const RecommendationState();
}

final class RecommendationInitial extends RecommendationState {
  @override
  List<Object> get props => [];
}

final class RecommendationMovieLoaded extends RecommendationState {
  final List<RecommendationMovie> recommendationMovie;

  const RecommendationMovieLoaded(this.recommendationMovie);

  @override
  List<Object?> get props => [recommendationMovie];
}

final class RecommendationMovieLoadingFailed extends RecommendationState {
  final String message;

  const RecommendationMovieLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
