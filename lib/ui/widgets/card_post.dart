import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/data/post_model.dart';
import 'package:social_media_app/ui/widgets/custom_bottom_sheet_comments.dart';

import 'clip_status_bar.dart';

class CardPost extends StatelessWidget {
  final PostModel post;

  const CardPost({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 460,
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        children: [
          _buildImageCover(),
          _buildImageGradient(),
          Positioned(
            height: 375,
            width: 85,
            right: 0,
            top: 25,
            child: Transform.rotate(
              angle: 3.14,
              child: ClipPath(
                clipper: ClipStatusBar(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: ColoredBox(
                    color: AppColors.whiteColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            right: 20,
            child: Column(
              children: [
                ..._itemStatus(
                    "assets/images/ic_heart.png", post.like, context),
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/ic_message.png", post.comment, context),
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/ic_bookmark.png", "Save", context),
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/ic_send.png", post.share, context),
              ],
            ),
          ),
          Positioned(
            width: 5,
            height: 30,
            right: 72,
            top: 200,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          _buildItemPublisher(context),
        ],
      ),
    );
  }

  Align _buildImageGradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(children: [
        BlurHash(
          imageFit: BoxFit.cover,
          hash: post.pictureHash,
        ),
        Image.network(
          post.picture,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  color: Colors.white.withOpacity(0.8),
                  strokeWidth: 1.2,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
        )
      ]),
    );
  }

  Container _buildItemPublisher(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 40, bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(NamedRoutes.profileScreen),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    post.imgProfile,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  post.name,
                  style: AppTheme.whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: AppTheme.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            post.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: AppTheme.regular,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            post.hashtags.join(" "),
            style: AppTheme.whiteTextStyle.copyWith(
              color: AppColors.greenColor,
              fontSize: 12,
              fontWeight: AppTheme.medium,
            ),
          ),
        ],
      ),
    );
  }

  _itemStatus(String icon, String text, BuildContext context) => [
    GestureDetector(
      onTap: icon == "assets/images/ic_message.png"
          ? () => customBottomSheetComments(context)
          : () {},
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            scale: 2.3,
            image: AssetImage(icon),
          ),
        ),
      ),
    ),
    const SizedBox(height: 4),
    Text(
      text,
      style: AppTheme.whiteTextStyle.copyWith(
        fontSize: 12,
        fontWeight: AppTheme.regular,
      ),
    ),
  ];
}
