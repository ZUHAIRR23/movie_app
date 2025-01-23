import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/recommendation_movie.dart';

import '../model/api_return_value.dart';
import '../service/movie_service.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit() : super(RecommendationInitial());

  Future<void> getRecommendationMovie(int id) async {
    ApiReturnValue<List<RecommendationMovie>> result =
        await MovieService.getRecommendationMovie(id: id);

    print(result);
    if (result.value != null) {
      emit(RecommendationMovieLoaded(result.value!));
    } else {
      emit(RecommendationMovieLoadingFailed(result.message!));
    }
  }
}
