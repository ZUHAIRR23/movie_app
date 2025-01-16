import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/api_return_value.dart';
import 'package:movie_app/model/now_playing_movie.dart';
import 'package:movie_app/service/movie_service.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  Future<void> getNowPlayingMovie() async {
    ApiReturnValue<List<NowPlayingMovie>> result =
    await MovieService.getNowPlayingMovie(page: 1);

    print(result);
    if (result.value != null) {
      emit(NowPlayingMovieLoaded(result.value!));
    } else {
      emit(NowPlayingMovieLoadingFailed(result.message!));
    }
  }
}
