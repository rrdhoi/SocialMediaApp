import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/bloc/gallery_profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          'Jenny Wilson',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: AppTheme.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_horiz_rounded,
            size: 24,
            color: AppColors.blackColor,
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageProfile(),
                const SizedBox(height: 16),
                Text(
                  "@Toa_Heftiba",
                  style: AppTheme.blackTextStyle.copyWith(
                    fontWeight: AppTheme.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 24),
                _buildDescription(),
                const SizedBox(height: 24),
                _buildButtonAction(),
                const SizedBox(height: 30),
                _buildTabBar(),
                const SizedBox(height: 24),
                _buildGridList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocProvider<GalleryProfileCubit> _buildGridList(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryProfileCubit()..getGalleryProfile(),
      child: BlocBuilder<GalleryProfileCubit, GalleryProfileState>(
        builder: (_, state) {
          if (state is GalleryProfileError) {
            return Center(child: Text(state.message));
          } else if (state is GalleryProfileLoaded) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.62,
                physics: const BouncingScrollPhysics(),
                children: state.galleryProfiles
                    .map((gallery) => Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    gallery.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                gallery.like,
                                style: AppTheme.blackTextStyle.copyWith(
                                    fontWeight: AppTheme.bold, fontSize: 10),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Row _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Photos",
          style: AppTheme.blackTextStyle.copyWith(
            fontWeight: AppTheme.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 24),
        Text(
          "Video",
          style: AppTheme.blackTextStyle.copyWith(
            fontWeight: AppTheme.bold,
            fontSize: 18,
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(width: 24),
        Text(
          "Tagged",
          style: AppTheme.blackTextStyle.copyWith(
            fontWeight: AppTheme.bold,
            fontSize: 18,
            color: AppColors.greyColor,
          ),
        ),
        const Spacer(),
        Image.asset("assets/images/ic_dots_2.png", width: 32),
      ],
    );
  }

  Row _buildButtonAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: AppColors.greenColor,
            minimumSize: const Size(120, 45),
            elevation: 8,
            shadowColor: AppColors.primaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Follow',
              style: AppTheme.whiteTextStyle
                  .copyWith(fontWeight: AppTheme.semiBold)),
        ),
        const SizedBox(width: 12),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyColor.withOpacity(0.17),
            image: const DecorationImage(
              scale: 2.3,
              image: AssetImage("assets/images/ic_inbox.png"),
            ),
          ),
        )
      ],
    );
  }

  Row _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "29",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Following",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "121.9k",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Followers",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "7.5M",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Likes",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildImageProfile() {
    return Container(
      width: 130,
      height: 130,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.dashedLineColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.network(
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODR8fHNvbGlkJTIwYmFja2dyb3VuZCUyMHBlb3BsZSUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          width: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
