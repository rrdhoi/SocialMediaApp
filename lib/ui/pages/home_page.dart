import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/bloc/post_cubit.dart';
import 'package:social_media_app/ui/widgets/card_post.dart';

import '../widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            _buildCustomAppBar(context),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) => PostCubit()..getPosts(),
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state is PostError) {
                    return Center(child: Text(state.message));
                  } else if (state is PostLoaded) {
                    return Column(
                      children: state.posts
                          .map((post) => GestureDetector(
                                child: CardPost(post: post),
                              ))
                          .toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  CustomAppBar _buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      child: Row(
        children: [
          const Icon(Icons.logo_dev, size: 48),
          const SizedBox(width: 8),
          const Icon(Icons.notifications_none_rounded, size: 24),
          const SizedBox(width: 8),
          const Icon(Icons.search_outlined, size: 24),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              children: [
                const Icon(Icons.account_circle, size: 32),
                const SizedBox(width: 2),
                Text(
                  "Sajon.co",
                  style: AppTheme.blackTextStyle.copyWith(
                    fontWeight: AppTheme.bold,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.check_circle,
                  size: 18,
                  color: Colors.green[400],
                ),
                const SizedBox(width: 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
