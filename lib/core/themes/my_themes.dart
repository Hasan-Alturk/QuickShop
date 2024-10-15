import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class MyThemes {
  static ThemeData customLightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: "Alexandria",
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onError: AppColors.onError,
        error: AppColors.onError,
      ),
    );
  }
}
