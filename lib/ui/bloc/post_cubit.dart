import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/data/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<String> _getJson() {
    return rootBundle.loadString('assets/json/data_post.json');
  }

  void getPosts() async {
    emit(PostLoading());
    try {
      List<dynamic> jsonResult = json.decode(await _getJson());
      List<PostModel> posts =
          jsonResult.map((e) => PostModel.fromJson(e)).toList();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: 'Terjadi kesalahan saat memuat data'));
    }
  }
}
