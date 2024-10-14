import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class MyThemes {
  static ThemeData customLightTheme = ThemeData(
    fontFamily: "Alexandria",
    primaryColor: AppColors.primaryColor, // لون رئيسي
    // يمكنك استبدال accentColor بـ colorScheme في Flutter 2.5+
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
      secondary: AppColors.redColor,
      surface: AppColors.whiteColor,
      error: AppColors.redColor,
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors.whiteColor,
      onSurface: AppColors.darkColor,
      onError: AppColors.whiteColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.lightColor, // لون خلفية الشاشة
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor, // لون خلفية شريط التطبيق
      iconTheme: IconThemeData(color: AppColors.whiteColor), // لون الأيقونات
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor, // لون نص عنوان شريط التطبيق
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkColor,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.secondryTextColor,
        fontSize: 14,
      ),
      displayLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.redColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: AppColors.whiteColor, // لون نص الأزرار
        fontSize: 16,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor, // لون الأزرار
      textTheme: ButtonTextTheme.primary, // نص زر بلون أبيض
    ),
    cardTheme: CardTheme(
      color: AppColors.containerColor, // لون خلفية البطاقة
      elevation: 4, // ظل البطاقة
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // زوايا البطاقة
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightColor, // لون خلفية حقل الإدخال
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grayColor), // لون الحدود
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: const TextStyle(
          color: AppColors.secondryTextColor), // لون النص المساعد
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.darkColor, // لون خلفية الأداة التوضيحية
        borderRadius: BorderRadius.circular(4), // زوايا الأداة التوضيحية
      ),
      textStyle: const TextStyle(
          color: AppColors.whiteColor), // لون نص الأداة التوضيحية
    ),
  );

  static ThemeData customDarkTheme = ThemeData(
    fontFamily: "Alexandria",
    primaryColor: AppColors.darkColor, // لون رئيسي للثيم الداكن
    colorScheme: const ColorScheme(
      primary: AppColors.darkColor,
      secondary: AppColors.redColor,
      surface: AppColors.darkColor, // لون الخلفية الداكن
      error: AppColors.redColor,
      onPrimary: AppColors.whiteColor,
      onSecondary: AppColors.whiteColor,
      onSurface: AppColors.lightColor,
      onError: AppColors.whiteColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.darkColor, // لون خلفية الشاشة
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor, // لون خلفية شريط التطبيق
      iconTheme: IconThemeData(color: AppColors.whiteColor), // لون الأيقونات
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor, // لون نص عنوان شريط التطبيق
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.grayColor,
        fontSize: 14,
      ),
      displayLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.redColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: AppColors.whiteColor, // لون نص الأزرار
        fontSize: 16,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor, // لون الأزرار
      textTheme: ButtonTextTheme.primary, // نص زر بلون أبيض
    ),
    cardTheme: CardTheme(
      color: AppColors.darkColor, // لون خلفية البطاقة
      elevation: 4, // ظل البطاقة
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // زوايا البطاقة
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightColor, // لون خلفية حقل الإدخال
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grayColor), // لون الحدود
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: const TextStyle(
          color: AppColors.secondryTextColor), // لون النص المساعد
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.darkColor, // لون خلفية الأداة التوضيحية
        borderRadius: BorderRadius.circular(4), // زوايا الأداة التوضيحية
      ),
      textStyle: const TextStyle(
          color: AppColors.whiteColor), // لون نص الأداة التوضيحية
    ),
  );
}
