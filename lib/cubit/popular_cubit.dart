import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/api_return_value.dart';
import 'package:movie_app/model/popular_movie.dart';
import 'package:movie_app/service/movie_service.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  Future<void> getPopularMovie() async {
    ApiReturnValue<List<PopularMovie>> result =
    await MovieService.getPopularMovie(page: 1);

    print(result);
    if (result.value != null) {
      emit(PopularMovieLoaded(result.value!));
    } else {
      emit(PopularMovieLoadingFailed(result.message!));
    }
  }
}
