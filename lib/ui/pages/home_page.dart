import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/bloc/post_cubit.dart';
import 'package:social_media_app/ui/widgets/card_post.dart';
import 'package:social_media_app/ui/widgets/clip_status_bar.dart';

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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  _buildCustomAppBar(context),
                  const SizedBox(height: 18),
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBackgroundGradient(),
          Positioned(
            bottom: 91,
            child: Transform.rotate(
              angle: 11,
              child: ClipPath(
                clipper: ClipStatusBar(),
                child: Container(
                  height: 110,
                  width: 40,
                  color: AppColors.blackColor,
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemBottomNavBar("assets/images/ic_home.png", "Home", true),
          _buildItemBottomNavBar(
              "assets/images/ic_discorvery.png", "Discover", false),
          _buildItemBottomNavBar("assets/images/ic_inbox.png", "Inbox", false),
          _buildItemBottomNavBar(
              "assets/images/ic_profile.png", "Profile", false),
        ],
      ),
    );
  }

  _buildItemBottomNavBar(String icon, String title, bool selected) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: selected ? AppColors.whiteColor : Colors.transparent,
        boxShadow: [
          if (selected)
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.1),
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 24,
            height: 24,
            color: selected ? AppColors.purpleColor : AppColors.blackColor,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 12,
              color: selected ? AppColors.purpleColor : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  _buildBackgroundGradient() => Container(
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        AppColors.whiteColor.withOpacity(0),
        AppColors.whiteColor.withOpacity(0.8),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
  );

  CustomAppBar _buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.2),
                  blurRadius: 35,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/ic_logo.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Image.asset("assets/images/ic_notification.png",
              width: 24, height: 24),
          const SizedBox(width: 12),
          Image.asset("assets/images/ic_search.png", width: 24, height: 24),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/img_profile.jpeg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "Sajon.co",
                  style: AppTheme.blackTextStyle
                      .copyWith(fontWeight: AppTheme.bold, fontSize: 12),
                ),
                const SizedBox(width: 2),
                Image.asset(
                  "assets/images/ic_checklist.png",
                  width: 16,
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
