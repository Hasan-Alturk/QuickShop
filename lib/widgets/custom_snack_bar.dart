import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_colors.dart';

class CustomSnackbar {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error', // عنوان الرسالة
      titleText: const Text(
        'Error',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: const TextStyle(
          color: AppColors.lightColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: AppColors.whiteColor, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الخروج
      reverseAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الدخول

      backgroundGradient: const LinearGradient(
        colors: [AppColors.darkColor, Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayBlur: 1, // تأثير ضبابي للخلفية
      overlayColor:
          Colors.black.withOpacity(0.4), // لون يغطي الخلفية خلف الإشعار
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
      'Success', // عنوان الرسالة
      titleText: const Text(
        'Success',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: const TextStyle(
          color: AppColors.lightColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: AppColors.whiteColor, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الخروج
      reverseAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الدخول

      backgroundGradient: const LinearGradient(
        colors: [AppColors.darkColor, Colors.green],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayBlur: 1, // تأثير ضبابي للخلفية
      overlayColor:
          Colors.black.withOpacity(0.4), // لون يغطي الخلفية خلف الإشعار
      icon: const Icon(
        Icons.check_circle_rounded,
        color: Colors.white,
        size: 40,
      ),
      shouldIconPulse: true, // حركة خفيفة للرمز
    );
  }
}
