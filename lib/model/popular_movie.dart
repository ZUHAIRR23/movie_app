import 'package:movie_app/model/movie.dart';

class PopularMovie extends Movie {
  const PopularMovie({
    super.id,
    super.title,
    super.overview,
    super.image,
    super.release,
    super.rating,
    super.genre,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> data) => PopularMovie(
        id: data["id"],
        title: data["title"],
        overview: data["overview"],
        image: data["backdrop_path"],
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
        release,
        rating,
        genre,
      ];
}
