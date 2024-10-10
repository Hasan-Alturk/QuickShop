import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class CustomSnackbar {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      '', // عنوان الرسالة
      titleText: const Text(
        'Error',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),

      message, // محتوى الرسالة
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: AppColors.whiteColor, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 600), // مدة الأنيميشن
      duration: const Duration(seconds: 3), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeOutBack, // منحنى حركة الخروج
      reverseAnimationCurve: Curves.easeInCubic, // منحنى حركة الدخول
      boxShadows: [
        const BoxShadow(
          color: AppColors.darkColor,
          blurRadius: 10,
          offset: Offset(0, 4), // لتكوين تأثير ظل خفيف
        )
      ],
      backgroundGradient: const LinearGradient(
        colors: [AppColors.darkColor, AppColors.redColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayBlur: 1, // تأثير ضبابي للخلفية
      overlayColor:
          Colors.black.withOpacity(0.5), // لون يغطي الخلفية خلف الإشعار
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.white,
        size: 40,
      ),
      shouldIconPulse: true, // حركة خفيفة للرمز
    );
  }

  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      '', // عنوان الرسالة
      titleText: const Text(
        'Success',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: AppColors.whiteColor, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 600), // مدة الأنيميشن
      duration: const Duration(seconds: 3), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeOutBack, // منحنى حركة الخروج
      reverseAnimationCurve: Curves.easeInCubic, // منحنى حركة الدخول
      boxShadows: [
        const BoxShadow(
          color: AppColors.darkColor,
          blurRadius: 10,
          offset: Offset(0, 4), // لتكوين تأثير ظل خفيف
        )
      ],
      backgroundGradient: const LinearGradient(
        colors: [AppColors.darkColor, AppColors.primaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayBlur: 1, // تأثير ضبابي للخلفية
      overlayColor:
          Colors.black.withOpacity(0.5), // لون يغطي الخلفية خلف الإشعار
      icon: const Icon(
        Icons.check_circle_rounded,
        color: Colors.white,
        size: 40,
      ),
      shouldIconPulse: true, // حركة خفيفة للرمز
    );
  }
}
