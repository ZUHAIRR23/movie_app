import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/credits.dart';

import '../model/api_return_value.dart';
import '../service/movie_service.dart';

part 'credits_state.dart';

class CreditsCubit extends Cubit<CreditsState> {
  CreditsCubit() : super(CreditsInitial());

  Future<void> getCreditsMovie(int id) async {
    ApiReturnValue<CreditsMovie> result =
    await MovieService.getCreditsMovie(id: id);

    print(result);
    if (result.value != null) {
      emit(CreditsMovieLoaded(result.value!));
    } else {
      emit(CreditsMovieLoadingFailed(result.message!));
    }
  }
}
