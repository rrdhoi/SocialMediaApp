import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';

void customBottomSheetComments(BuildContext context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 6,
              margin: const EdgeInsets.only(top: 16, bottom: 6),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Comments",
                              style: AppTheme.blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: AppTheme.bold,
                              ),
                            ),
                            const Icon(
                              Icons.more_horiz_rounded,
                              color: AppColors.blackColor,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      _buildCommentCardSheet(
                        "https://images.unsplash.com/photo-1535295972055-1c762f4483e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                        "Merry Smith",
                        "I see you are a good photographer and I like your photos, I hope you will continue to take good photos, I will follow you",
                        "15 minute ago",
                      ),
                      Divider(
                        color: AppColors.dashedLineColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                      const SizedBox(height: 6),
                      _buildCommentCardSheet(
                        "https://images.unsplash.com/photo-1592573390440-64a8a2349e3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGdpcmwlMjBpbWFnZXMlMjAlMjYlMjBwaWN0dXJlc3xlbnwwfDF8MHxibHVlfA%3D%3D&auto=format&fit=crop&w=500&q=60",
                        "Jessica Alba",
                        "Nice photo, I like it. Would you like to follow me?, I will follow you back. Thank you",
                        "25 minute ago",
                      ),
                      Divider(
                        color: AppColors.backgroundColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                      const SizedBox(height: 6),
                      _buildCommentCardSheet(
                        "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                        "Jennifer Lawrence",
                        "Wow nice photo, did you take it yourself?",
                        "30 minute ago",
                      ),
                      Divider(
                        color: AppColors.dashedLineColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Padding _buildCommentCardSheet(
        String image, String name, String comment, String time) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 45,
              height: 45,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTheme.blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: AppTheme.greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: AppTheme.medium,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    // TODO:: Color Button | Green
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(12, 38),
                        primary: AppColors.backgroundColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset("assets/images/ic_share.png", width: 16),
                          const SizedBox(width: 8),
                          Text(
                            "Reply",
                            style: AppTheme.blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: AppTheme.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      time,
                      style: AppTheme.greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: AppTheme.medium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset("assets/images/ic_calendar.png", width: 14),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
