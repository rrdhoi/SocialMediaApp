part of 'gallery_profile_cubit.dart';

abstract class GalleryProfileState {}

class GalleryProfileInitial extends GalleryProfileState {}

class GalleryProfileLoading extends GalleryProfileState {}

class GalleryProfileLoaded extends GalleryProfileState {
  final List<GalleryModel> galleryProfiles;

  GalleryProfileLoaded({required this.galleryProfiles});
}

class GalleryProfileError extends GalleryProfileState {
  final String message;

  GalleryProfileError({required this.message});
}
