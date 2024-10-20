import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class MyThemes {
  static ThemeData customLightTheme() {
    return ThemeData(
        fontFamily: "Alexandria",
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightColorLight,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryColorLight,
          onPrimary: AppColors.whiteColorLight,
          primaryContainer: AppColors.containerColorLight,
          secondary: AppColors.darkColorLight,
          onSecondary: AppColors.grayColorLight,
          surface: AppColors.nonActiveColorLight,
          onSurface: AppColors.seconderyColorLight,
          onError: AppColors.redColorLight,
          error: AppColors.redColorLight,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.whiteColorLight,
          iconTheme: IconThemeData(
            color: AppColors.primaryColorLight,
          ),
        ));
  }

  static ThemeData customDarkTheme() {
    return ThemeData(
      fontFamily: "Alexandria",
      useMaterial3: true,
    );
  }
}
