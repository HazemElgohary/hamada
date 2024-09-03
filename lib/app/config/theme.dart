import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0xFF2AAFB4);
  static Color secondColor = const Color(0xFFBEE7E8);
  static Color loadingColor = const Color(0xFFAC2F2F);
  static Color cardColor = const Color(0xFFF5F5F5);
  static Color borderColor = const Color(0xFFE9E9E9);
  static Color yellowColor = const Color(0xFFF6CF3D);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: GoogleFonts.cairoTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.whiteColor,
    // toggleableActiveColor: AppColors.primary,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      // color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: context.textTheme.titleLarge!.copyWith(
        color: AppColors.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.whiteColor, size: 30),
    ),
    dividerColor: Colors.transparent,
    radioTheme: RadioThemeData(fillColor: WidgetStateColor.resolveWith((states) => Colors.black)),
    indicatorColor: AppColors.primary,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  );
}
