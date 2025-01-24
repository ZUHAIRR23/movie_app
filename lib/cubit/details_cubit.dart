import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/api_return_value.dart';
import '../model/details_movie.dart';
import '../service/movie_service.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  Future<void> getDetailsMovie(int id) async {
    ApiReturnValue<DetailsMovie> result =
    await MovieService.getDetailsMovie(id: id);

    print(result);
    if (result.value != null) {
      emit(DetailsMovieLoaded(result.value!));
    } else {
      emit(DetailsMovieLoadingFailed(result.message!));
    }
  }
}
