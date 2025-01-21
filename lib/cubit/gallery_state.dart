part of 'gallery_cubit.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();
}

final class GalleryInitial extends GalleryState {
  @override
  List<Object> get props => [];
}

final class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];
}

final class GalleryLoaded extends GalleryState {
  final List<Gallery> gallery;

  const GalleryLoaded(this.gallery);

  @override
  List<Object> get props => [gallery];

  @override
  String toString() =>
      'GalleryLoaded { movies: ${gallery.length} }';
}

final class GalleryLoadingFailed extends GalleryState {
  final String message;

  const GalleryLoadingFailed(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'GalleryLoadingFailed { message: $message }';
}
