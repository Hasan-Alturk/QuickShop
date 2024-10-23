import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error', // عنوان الرسالة
      titleText: Text(
        'Error',
        style: TextStyle(
          color: Get.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: TextStyle(
          color: Get.theme.scaffoldBackgroundColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: Get.theme.colorScheme.onPrimary, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الخروج
      reverseAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الدخول

      backgroundGradient: LinearGradient(
        colors: [
          Get.theme.colorScheme.secondary,
          Get.theme.colorScheme.onError
        ],
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
      shouldIconPulse: false, // حركة خفيفة للرمز
    );
  }

  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success', // عنوان الرسالة
      titleText: Text(
        'Success',
        style: TextStyle(
          color: Get.theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      message, // محتوى الرسالة
      messageText: Text(
        message,
        style: TextStyle(
          color: Get.theme.scaffoldBackgroundColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.TOP, // مكان عرض الرسالة
      backgroundColor: Colors.black.withOpacity(0.8), // خلفية شبه شفافة
      colorText: Get.theme.colorScheme.onPrimary, // لون النص
      borderRadius: 32, // لتدوير الحواف
      margin: const EdgeInsets.all(16), // هامش من كل الجوانب
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 20), // مسافات داخلية أكبر
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2), // مدة عرض الإشعار
      forwardAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الخروج
      reverseAnimationCurve: Curves.easeInOut, // منحنى حركة سلس عند الدخول

      backgroundGradient: LinearGradient(
        colors: [Get.theme.colorScheme.secondary, Colors.green],
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
