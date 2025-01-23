import 'package:movie_app/model/movie.dart';

class NowPlayingMovie extends Movie {
  const NowPlayingMovie({
    super.id,
    super.title,
    super.overview,
    super.image,
    super.poster,
    super.release,
    super.rating,
    super.genre,
  });

  factory NowPlayingMovie.fromJson(Map<String, dynamic> data) =>
      NowPlayingMovie(
        id: data["id"],
        title: data["title"],
        overview: data["overview"],
        image: data["backdrop_path"],
        poster: data["poster_path"],
        release: data["release_date"],
        rating: data["vote_average"],
        genre: List<String>.from(data["genre_ids"].map((x) => x.toString())),
      );

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        image,
        poster,
        release,
        rating,
        genre,
      ];
}
