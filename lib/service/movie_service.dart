import 'dart:convert';
import 'package:movie_app/model/api_return_value.dart';
import 'package:http/http.dart' as http;
import '../model/popular_movie.dart';

String baseUrl = "https://api.themoviedb.org/3";
String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjgzYTZmOThkOTM1ZDc4NjU5ZDZlOGI4M2U3ZjJmYiIsIm5iZiI6MTcyNTUyMjQwOS43NTcsInN1YiI6IjY2ZDk2MWU5YmU3YzgyZTNlZWI4Y2ZmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0wk-pOh98PGWiLhygSxn56XtLXQQhdoJMTFoW1NYnkQ";

class MovieService {
  static Future<ApiReturnValue<List<PopularMovie>>> getPopularMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/popular?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Popular Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<PopularMovie> popularMovie = (data["results"] as Iterable)
          .map((e) => PopularMovie.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: popularMovie,
      );
    }
  }
}
