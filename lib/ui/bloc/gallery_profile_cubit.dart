import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/data/gallery_model.dart';

part 'gallery_profile_state.dart';

class GalleryProfileCubit extends Cubit<GalleryProfileState> {
  GalleryProfileCubit() : super(GalleryProfileInitial());

  Future<String> _getJson() =>
      rootBundle.loadString('assets/json/data_gallery.json');

  void getGalleryProfile() async {
    emit(GalleryProfileLoading());
    try {
      List<dynamic> jsonResult = json.decode(await _getJson());
      List<GalleryModel> galleries =
          jsonResult.map((e) => GalleryModel.fromJson(e)).toList();
      emit(GalleryProfileLoaded(galleryProfiles: galleries));
    } catch (e) {
      emit(GalleryProfileError(message: 'Terjadi kesalahan saat memuat data'));
    }
  }
}
