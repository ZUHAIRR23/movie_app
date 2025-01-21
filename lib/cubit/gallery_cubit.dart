import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/gallery.dart';

import '../model/api_return_value.dart';
import '../service/movie_service.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  Future<void> getGallery() async {
    ApiReturnValue<List<Gallery>> result =
    await MovieService.getGallery();

    print(result);
    if (result.value != null) {
      emit(GalleryLoaded(result.value!));
    } else {
      emit(GalleryLoadingFailed(result.message!));
    }
  }
}
