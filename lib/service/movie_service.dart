import 'dart:convert';
import 'package:movie_app/model/api_return_value.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/now_playing_movie.dart';
import '../model/credits.dart';
import '../model/details_movie.dart';
import '../model/gallery.dart';
import '../model/popular_movie.dart';
import '../model/recommendation_movie.dart';

String baseUrl = "https://api.themoviedb.org/3";
String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MjgzYTZmOThkOTM1ZDc4NjU5ZDZlOGI4M2U3ZjJmYiIsIm5iZiI6MTcyNTUyMjQwOS43NTcsInN1YiI6IjY2ZDk2MWU5YmU3YzgyZTNlZWI4Y2ZmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0wk-pOh98PGWiLhygSxn56XtLXQQhdoJMTFoW1NYnkQ";

class MovieService {
  // Popular Movie
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

  // Now Playing Movie
  static Future<ApiReturnValue<List<NowPlayingMovie>>> getNowPlayingMovie(
      {int? page, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/now_playing?language=en-US&page=${page ?? 1}";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Now Playing Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      List<NowPlayingMovie> nowPlayingMovie = (data["results"] as Iterable)
          .map((e) => NowPlayingMovie.fromJson(e))
          .toList();

      return ApiReturnValue(
        value: nowPlayingMovie,
      );
    }
  }

  // Gallery
  static Future<ApiReturnValue<Gallery>> getGallery(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/images";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Now Gallery",
      );
    } else {
      var data = jsonDecode(response.body);

      Gallery gallery = Gallery.fromJson(data);

      return ApiReturnValue(
        value: gallery,
      );
    }
  }

  // Recommendations
  static Future<ApiReturnValue<List<RecommendationMovie>>>
      getRecommendationMovie({int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/recommendations";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Fetch The Recommendations");
    } else {
      var data = jsonDecode(response.body);

      List<RecommendationMovie> recommendationMovie =
          (data["results"] as Iterable)
              .map((e) => RecommendationMovie.fromJson(e))
              .toList();

      return ApiReturnValue(
        value: recommendationMovie,
      );
    }
  }

  // Details
  static Future<ApiReturnValue<DetailsMovie>> getDetailsMovie(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id?language=en-US";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Now Playing Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      DetailsMovie movie = DetailsMovie.fromJson(data);

      return ApiReturnValue(
        value: movie,
      );
    }
  }

  // Credits
  static Future<ApiReturnValue<CreditsMovie>> getCreditsMovie(
      {int? id, http.Client? client}) async {
    client ??= http.Client();

    String url = "$baseUrl/movie/$id/credits?language=en-US";

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: "Failed To Fetch The Now Playing Movie",
      );
    } else {
      var data = jsonDecode(response.body);

      CreditsMovie movie = CreditsMovie.fromJson(data);

      return ApiReturnValue(
        value: movie,
      );
    }
  }
}
