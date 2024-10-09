import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class MyThemes {
  static ThemeData customLightTheme = ThemeData(
    fontFamily: "Alexandria",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,

      // titleTextStyle:
      //     AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static ThemeData customDarkTheme = ThemeData(
    fontFamily: "Alexandria",
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkColor, centerTitle: true),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
