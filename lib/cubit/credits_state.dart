part of 'credits_cubit.dart';

sealed class CreditsState extends Equatable {
  const CreditsState();
}

final class CreditsInitial extends CreditsState {
  @override
  List<Object> get props => [];
}

final class CreditsMovieLoaded extends CreditsState {
  final CreditsMovie creditsMovie;

  const CreditsMovieLoaded(this.creditsMovie);

  @override
  List<Object?> get props => [creditsMovie];
}

final class CreditsMovieLoadingFailed extends CreditsState {
  final String message;

  const CreditsMovieLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}