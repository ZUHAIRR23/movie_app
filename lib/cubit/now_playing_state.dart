part of 'now_playing_cubit.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();
}

final class NowPlayingInitial extends NowPlayingState {
  @override
  List<Object> get props => [];
}

final class NowPlayingLoading extends NowPlayingState {
  @override
  List<Object> get props => [];
}

final class NowPlayingMovieLoaded extends NowPlayingState {
  final List<NowPlayingMovie> nowPlayingMovie;

  const NowPlayingMovieLoaded(this.nowPlayingMovie);

  @override
  List<Object> get props => [nowPlayingMovie];

  @override
  String toString() =>
      'NowPlayingMovieLoaded { movies: ${nowPlayingMovie.length} }';
}

final class NowPlayingMovieLoadingFailed extends NowPlayingState {
  final String message;

  const NowPlayingMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'NowPlayingMovieLoadingFailed { message: $message }';
}
