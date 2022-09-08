import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/app/configs/colors.dart';

class Themes {
  static final TextStyle lightText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.blackTextColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(toolbarTextStyle: lightText),
    textTheme: TextTheme(
      bodyText1: lightText,
      bodyText2: lightText,
      button: lightText,
      caption: lightText,
      overline: lightText,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    navigationBarTheme: const NavigationBarThemeData(
      // indicatorColor: AppColors.backgroundColor,
      indicatorColor: AppColors.whiteColor,
    ),
  );
}
