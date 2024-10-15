import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class MyThemes {
  static ThemeData customLightTheme() {
    return ThemeData(
      fontFamily: "Alexandria",
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimaryLight,
        primaryContainer: AppColors.primaryContainerLight,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.onSecondaryLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.onSurfaceLight,
        onError: AppColors.onErrorLight,
        error: AppColors.onErrorLight,
      ),
    );
  }

  static ThemeData customDarkTheme() {
    return ThemeData(
      fontFamily: "Alexandria",
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        primaryContainer: AppColors.primaryContainerDark,
        secondary: AppColors.secondaryDark,
        onSecondary: AppColors.onSecondaryDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark,
        onError: AppColors.onErrorDark,
        error: AppColors.onErrorDark,
      ),
    );
  }
}
